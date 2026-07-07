#!/usr/bin/env python3
from __future__ import annotations

import re
import subprocess
import sys
from pathlib import Path
from typing import Iterable, List, Sequence
from urllib.parse import unquote


ROOT = Path(__file__).resolve().parents[1]

PYTHON_SCRIPTS = [
    ROOT / "scripts" / "check_project.py",
    ROOT / "scripts" / "check_word_templates.py",
    ROOT / "scripts" / "package_release.py",
]

CRITICAL_PATHS = [
    ROOT / "README.md",
    ROOT / "Makefile",
    ROOT / "archive" / "README.md",
    ROOT / "archive" / "original" / "新建文件夹",
    ROOT / "archive" / "original" / "新建文件夹" / "zzuthesis.zip",
    ROOT / "archive" / "original" / "新建文件夹" / "zzuthesis-本科.7z",
    ROOT / "archive" / "original" / "新建文件夹" / "zzuthesis-专业硕士.7z",
    ROOT / "archive" / "original" / "郑州大学硕士学位论文模板.zip",
    ROOT / "archive" / "original" / "MasterThesis" / "Common" / "Template" / "MasterThesis.cls",
    ROOT / "archive" / "original" / "word-templates" / "郑大毕业论文（设计）模板-V2.docx",
    ROOT / "archive" / "original" / "word-templates" / "collected-docx" / "论文模板-20250429.docx",
    ROOT / "archive" / "original" / "word-templates" / "collected-docx" / "郑大毕业论文0602.docx",
    ROOT / "archive" / "original" / "word-templates" / "collected-docx" / "郑州大学外文文献和翻译模版.docx",
    ROOT / "archive" / "original" / "word-templates" / "collected-docx" / "郑州大学毕业论文答辩记录.docx",
    ROOT / "archive" / "original" / "word-templates" / "collected-doc" / "郑州大学2026届本科毕业论文模板使用情况说明-20260503.doc",
    ROOT / "archive" / "original" / "word-templates" / "collected-doc" / "01-2023毕业论文模版（有说明）.doc",
    ROOT / "archive" / "original" / "word-templates" / "course-report-templates" / "结构分析程序应用课程设计报告模板(1).docx",
    ROOT / "archive" / "original" / "word-templates" / "course-report-templates" / "计算力学程序设计报告模板.doc",
    ROOT / "docs" / "USAGE.md",
    ROOT / "docs" / "FAQ.md",
    ROOT / "docs" / "PROJECT_MAP.md",
    ROOT / "docs" / "MAINTAINING.md",
    ROOT / "docs" / "RELEASE.md",
    ROOT / "docs" / "VITEPRESS.md",
    ROOT / "docs" / "index.md",
    ROOT / "docs" / ".vitepress" / "config.mts",
    ROOT / "package.json",
    ROOT / "package-lock.json",
    ROOT / "scripts" / "check_project.py",
    ROOT / "scripts" / "check_word_templates.py",
    ROOT / "scripts" / "package_release.py",
    ROOT / ".github" / "workflows" / "build.yml",
    ROOT / ".github" / "workflows" / "release.yml",
    ROOT / "templates" / "README.md",
    ROOT / "templates" / "word" / "README.md",
]

MARKDOWN_LINK = re.compile(r"!?\[[^\]]*]\(([^)]+)\)")

PY_COMPILE_SNIPPET = """
import sys
from pathlib import Path

for path in sys.argv[1:]:
    source = Path(path).read_text(encoding="utf-8")
    compile(source, path, "exec")
"""


def display_path(path: Path) -> str:
    try:
        return str(path.relative_to(ROOT))
    except ValueError:
        return str(path)


def run_step(title: str, command: Sequence[str]) -> bool:
    print(f"==> {title}", flush=True)
    result = subprocess.run(command, cwd=str(ROOT))
    if result.returncode == 0:
        print(f"OK {title}", flush=True)
        return True
    print(f"FAIL {title}: exit {result.returncode}", file=sys.stderr, flush=True)
    return False


def iter_markdown_files() -> Iterable[Path]:
    ignored_parts = {".git", "dist", "__pycache__", "node_modules"}
    ignored_paths = {
        Path("docs") / ".vitepress" / "cache",
        Path("docs") / ".vitepress" / "dist",
    }
    for path in sorted(ROOT.rglob("*.md")):
        relative = path.relative_to(ROOT)
        if any(part in ignored_parts for part in relative.parts):
            continue
        if any(relative.is_relative_to(ignored_path) for ignored_path in ignored_paths):
            continue
        yield path


def is_external_link(target: str) -> bool:
    lowered = target.lower()
    return (
        lowered.startswith("http://")
        or lowered.startswith("https://")
        or lowered.startswith("mailto:")
        or lowered.startswith("#")
    )


def normalize_link_target(raw_target: str) -> str:
    target = raw_target.strip()
    if target.startswith("<") and target.endswith(">"):
        target = target[1:-1].strip()
    target = target.split("#", 1)[0].strip()
    return unquote(target)


def check_markdown_links() -> List[str]:
    errors: List[str] = []
    for path in iter_markdown_files():
        text = path.read_text(encoding="utf-8")
        for match in MARKDOWN_LINK.finditer(text):
            raw_target = match.group(1)
            target = normalize_link_target(raw_target)
            if not target or is_external_link(target):
                continue
            if target.startswith("/"):
                resolved = ROOT / target.lstrip("/")
            else:
                resolved = path.parent / target
            if not resolved.exists():
                errors.append(f"{display_path(path)} -> missing link target: {raw_target}")
    return errors


def check_critical_paths() -> List[str]:
    errors = []
    for path in CRITICAL_PATHS:
        if not path.exists():
            errors.append(f"missing critical file: {display_path(path)}")

    docx_files = sorted((ROOT / "templates" / "word").glob("*.docx"))
    if not docx_files:
        errors.append("missing Word templates: templates/word/*.docx")
    return errors


def run_static_checks() -> bool:
    errors = check_critical_paths()
    errors.extend(check_markdown_links())

    if errors:
        print("FAIL Markdown and critical file checks", file=sys.stderr)
        for error in errors:
            print(f"- {error}", file=sys.stderr)
        return False

    print("OK Markdown links and critical files", flush=True)
    return True


def main() -> int:
    checks = [
        run_step(
            "Python syntax check",
            [sys.executable, "-c", PY_COMPILE_SNIPPET, *[str(path) for path in PYTHON_SCRIPTS]],
        ),
        run_step(
            "Word template integrity check",
            [sys.executable, "scripts/check_word_templates.py"],
        ),
        run_step(
            "Release package structure check",
            [
                sys.executable,
                "scripts/package_release.py",
                "--check",
                "--version",
                "check-local",
            ],
        ),
        run_static_checks(),
    ]

    if all(checks):
        print("Project check completed successfully.")
        return 0

    print("Project check failed.", file=sys.stderr)
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
