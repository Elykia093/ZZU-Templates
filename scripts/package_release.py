#!/usr/bin/env python3
from __future__ import annotations

import argparse
from dataclasses import dataclass
import subprocess
import sys
from pathlib import PurePosixPath
from pathlib import Path
from tempfile import TemporaryDirectory
from typing import Iterable, List, Optional, Sequence, Tuple
from zipfile import ZIP_DEFLATED, ZipFile


ROOT = Path(__file__).resolve().parents[1]
DIST_DIR = ROOT / "dist"
WORD_DIR = ROOT / "templates" / "word"

SOURCE_ROOTS = [
    ROOT / "README.md",
    ROOT / "Makefile",
    ROOT / "archive",
    ROOT / "docs",
    ROOT / "scripts",
    ROOT / "templates",
]

EXCLUDED_DIRS = {
    ".git",
    ".github",
    ".vscode",
    "__pycache__",
    "dist",
}

EXCLUDED_SUFFIXES = {
    ".aux",
    ".bbl",
    ".blg",
    ".fls",
    ".fdb_latexmk",
    ".idx",
    ".ilg",
    ".ind",
    ".lof",
    ".log",
    ".lot",
    ".out",
    ".synctex.gz",
    ".toc",
}

REQUIRED_SOURCE_FILES = [
    "README.md",
    "Makefile",
    "archive/README.md",
    "archive/original/新建文件夹/zzuthesis.zip",
    "archive/original/新建文件夹/zzuthesis-本科.7z",
    "archive/original/新建文件夹/zzuthesis-专业硕士.7z",
    "archive/original/郑州大学硕士学位论文模板.zip",
    "archive/original/MasterThesis/Common/Template/MasterThesis.cls",
    "archive/original/word-templates/郑大毕业论文（设计）模板-V2.docx",
    "archive/original/word-templates/collected-docx/论文模板-20250429.docx",
    "archive/original/word-templates/collected-docx/郑大毕业论文0602.docx",
    "archive/original/word-templates/collected-docx/郑州大学外文文献和翻译模版.docx",
    "archive/original/word-templates/collected-docx/郑州大学毕业论文答辩记录.docx",
    "archive/original/word-templates/collected-doc/郑州大学2026届本科毕业论文模板使用情况说明-20260503.doc",
    "archive/original/word-templates/collected-doc/01-2023毕业论文模版（有说明）.doc",
    "archive/original/word-templates/course-report-templates/结构分析程序应用课程设计报告模板(1).docx",
    "archive/original/word-templates/course-report-templates/计算力学程序设计报告模板.doc",
    "docs/USAGE.md",
    "docs/FAQ.md",
    "docs/PROJECT_MAP.md",
    "docs/MAINTAINING.md",
    "docs/RELEASE.md",
    "scripts/check_word_templates.py",
    "scripts/check_project.py",
    "scripts/package_release.py",
    "templates/README.md",
    "templates/word/README.md",
]


@dataclass
class PackageSpec:
    label: str
    path: Path
    prefix: str
    expected_files: List[Path]


@dataclass
class ZipSummary:
    label: str
    path: Path
    file_count: int
    size_bytes: int
    docx_count: int
    roots: Tuple[str, ...]


def git_describe() -> str:
    try:
        result = subprocess.run(
            ["git", "describe", "--tags", "--always", "--dirty"],
            cwd=str(ROOT),
            check=True,
            text=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
        )
    except (OSError, subprocess.CalledProcessError):
        return "snapshot"
    return result.stdout.strip() or "snapshot"


def normalized_version(value: str) -> str:
    cleaned = value.strip().replace("/", "-").replace("\\", "-")
    return cleaned or "snapshot"


def should_include(path: Path) -> bool:
    relative = path.relative_to(ROOT)
    if any(part in EXCLUDED_DIRS for part in relative.parts):
        return False
    return not any(str(relative).endswith(suffix) for suffix in EXCLUDED_SUFFIXES)


def iter_files(paths: Sequence[Path]) -> Iterable[Path]:
    for path in paths:
        if path.is_file():
            if should_include(path):
                yield path
            continue

        for child in sorted(path.rglob("*")):
            if child.is_file() and should_include(child):
                yield child


def display_path(path: Path) -> str:
    try:
        return str(path.relative_to(ROOT))
    except ValueError:
        return str(path)


def expected_names(files: Sequence[Path], prefix: str) -> List[str]:
    names = []
    for path in files:
        relative = path.relative_to(ROOT).as_posix()
        names.append((PurePosixPath(prefix) / relative).as_posix())
    return sorted(names)


def archive_names(path: Path) -> List[str]:
    with ZipFile(path) as archive:
        return sorted(name for name in archive.namelist() if not name.endswith("/"))


def write_zip(output: Path, files: Iterable[Path], prefix: str) -> int:
    count = 0
    with ZipFile(output, "w", ZIP_DEFLATED) as archive:
        for path in files:
            arcname = Path(prefix) / path.relative_to(ROOT)
            archive.write(path, arcname.as_posix())
            count += 1
    return count


def summarize_zip(path: Path, label: str) -> ZipSummary:
    names = archive_names(path)
    roots = set()
    docx_count = 0
    for name in names:
        parts = PurePosixPath(name).parts
        if len(parts) > 1:
            roots.add(parts[1])
        if name.endswith(".docx"):
            docx_count += 1

    return ZipSummary(
        label=label,
        path=path,
        file_count=len(names),
        size_bytes=path.stat().st_size,
        docx_count=docx_count,
        roots=tuple(sorted(roots)),
    )


def print_zip_summary(summary: ZipSummary) -> None:
    size_kib = summary.size_bytes / 1024
    print(f"- {summary.label}: {display_path(summary.path)}")
    print(f"  files: {summary.file_count}, size: {size_kib:.1f} KiB")
    if summary.docx_count:
        print(f"  docx: {summary.docx_count}")
    if summary.roots:
        print(f"  roots: {', '.join(summary.roots)}")


def validate_zip(spec: PackageSpec, required_inside: Sequence[str]) -> None:
    with ZipFile(spec.path) as archive:
        corrupt_member = archive.testzip()
    if corrupt_member is not None:
        raise RuntimeError(f"{display_path(spec.path)} has corrupt member: {corrupt_member}")

    names = archive_names(spec.path)
    expected = expected_names(spec.expected_files, spec.prefix)
    missing = sorted(set(expected) - set(names))
    extra = sorted(set(names) - set(expected))
    if missing or extra:
        details = []
        if missing:
            details.append("missing: " + ", ".join(missing[:10]))
        if extra:
            details.append("extra: " + ", ".join(extra[:10]))
        raise RuntimeError(f"{display_path(spec.path)} content mismatch ({'; '.join(details)})")

    for name in names:
        parts = PurePosixPath(name).parts
        if not parts or parts[0] != spec.prefix:
            raise RuntimeError(f"{display_path(spec.path)} has unexpected prefix: {name}")
        if ".." in parts:
            raise RuntimeError(f"{display_path(spec.path)} has unsafe path: {name}")

    missing_required = []
    for relative in required_inside:
        archive_name = (PurePosixPath(spec.prefix) / relative).as_posix()
        if archive_name not in names:
            missing_required.append(relative)
    if missing_required:
        raise RuntimeError(
            f"{display_path(spec.path)} is missing required file(s): "
            + ", ".join(missing_required)
        )


def package_word_templates(version: str, dist_dir: Path) -> PackageSpec:
    files = sorted(WORD_DIR.glob("*.docx"))
    if not files:
        raise RuntimeError(f"No Word templates found in {WORD_DIR}")

    prefix = f"zzu-word-thesis-templates-{version}"
    output = dist_dir / f"{prefix}.zip"
    count = write_zip(output, files, prefix)
    print(f"Packed {count} Word template(s): {display_path(output)}")
    return PackageSpec("Word templates zip", output, prefix, files)


def package_source(version: str, dist_dir: Path) -> PackageSpec:
    files = list(iter_files(SOURCE_ROOTS))
    if not files:
        raise RuntimeError("No source files found for release package")

    prefix = f"zzu-templates-{version}"
    output = dist_dir / f"zzu-templates-source-{version}.zip"
    count = write_zip(output, files, prefix)
    print(f"Packed {count} source file(s): {display_path(output)}")
    return PackageSpec("Source zip", output, prefix, files)


def package_release(version: str, dist_dir: Path) -> List[PackageSpec]:
    dist_dir.mkdir(parents=True, exist_ok=True)
    return [
        package_word_templates(version, dist_dir),
        package_source(version, dist_dir),
    ]


def validate_release(specs: Sequence[PackageSpec]) -> None:
    for spec in specs:
        if spec.label == "Source zip":
            validate_zip(spec, REQUIRED_SOURCE_FILES)
        else:
            validate_zip(spec, [])


def print_release_summary(specs: Sequence[PackageSpec]) -> None:
    print("Release artifact summary:")
    for spec in specs:
        print_zip_summary(summarize_zip(spec.path, spec.label))


def parse_args(argv: Sequence[str]) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Package ZZU-Templates release assets.")
    parser.add_argument(
        "--version",
        default=git_describe(),
        help="Version string used in artifact names. Defaults to git describe.",
    )
    parser.add_argument(
        "--dist-dir",
        type=Path,
        default=DIST_DIR,
        help="Directory where release artifacts are written.",
    )
    parser.add_argument(
        "--check",
        action="store_true",
        help="Validate release zip structure using a temporary directory and remove artifacts afterward.",
    )
    return parser.parse_args(argv)


def main(argv: Optional[Sequence[str]] = None) -> int:
    args = parse_args(sys.argv[1:] if argv is None else argv)
    version = normalized_version(args.version)

    if args.check:
        with TemporaryDirectory(prefix="zzu-release-check-") as temporary_dir:
            dist_dir = Path(temporary_dir)
            specs = package_release(version, dist_dir)
            validate_release(specs)
            print_release_summary(specs)
        print("Check mode completed; temporary release artifacts were removed.")
        return 0

    dist_dir = args.dist_dir.resolve()
    specs = package_release(version, dist_dir)
    validate_release(specs)
    print_release_summary(specs)

    print("Release artifacts:")
    for spec in specs:
        print(f"- {display_path(spec.path)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
