#!/usr/bin/env python3
from __future__ import annotations

import argparse
import subprocess
import sys
from pathlib import Path
from typing import Iterable, List, Optional, Sequence
from zipfile import ZIP_DEFLATED, ZipFile


ROOT = Path(__file__).resolve().parents[1]
DIST_DIR = ROOT / "dist"
WORD_DIR = ROOT / "templates" / "word"

SOURCE_ROOTS = [
    ROOT / "README.md",
    ROOT / "Makefile",
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


def write_zip(output: Path, files: Iterable[Path], prefix: str) -> int:
    count = 0
    with ZipFile(output, "w", ZIP_DEFLATED) as archive:
        for path in files:
            arcname = Path(prefix) / path.relative_to(ROOT)
            archive.write(path, arcname.as_posix())
            count += 1
    return count


def package_word_templates(version: str) -> Path:
    files = sorted(WORD_DIR.glob("*.docx"))
    if not files:
        raise RuntimeError(f"No Word templates found in {WORD_DIR}")

    output = DIST_DIR / f"zzu-word-thesis-templates-{version}.zip"
    count = write_zip(output, files, f"zzu-word-thesis-templates-{version}")
    print(f"Packed {count} Word template(s): {output.relative_to(ROOT)}")
    return output


def package_source(version: str) -> Path:
    files = list(iter_files(SOURCE_ROOTS))
    if not files:
        raise RuntimeError("No source files found for release package")

    output = DIST_DIR / f"zzu-templates-source-{version}.zip"
    count = write_zip(output, files, f"zzu-templates-{version}")
    print(f"Packed {count} source file(s): {output.relative_to(ROOT)}")
    return output


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
    return parser.parse_args(argv)


def main(argv: Optional[Sequence[str]] = None) -> int:
    args = parse_args(sys.argv[1:] if argv is None else argv)
    version = normalized_version(args.version)

    global DIST_DIR
    DIST_DIR = args.dist_dir.resolve()
    DIST_DIR.mkdir(parents=True, exist_ok=True)

    artifacts: List[Path] = [
        package_word_templates(version),
        package_source(version),
    ]

    print("Release artifacts:")
    for artifact in artifacts:
        print(f"- {artifact.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
