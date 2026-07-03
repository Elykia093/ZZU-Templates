#!/usr/bin/env python3
from __future__ import annotations

import sys
from pathlib import Path
from typing import List, Optional, Tuple
from zipfile import BadZipFile, ZipFile


ROOT = Path(__file__).resolve().parents[1]
WORD_DIR = ROOT / "templates" / "word"


def check_docx(path: Path) -> Optional[str]:
    try:
        with ZipFile(path) as archive:
            corrupt_member = archive.testzip()
    except BadZipFile as exc:
        return f"invalid zip: {exc}"
    except OSError as exc:
        return f"cannot read: {exc}"

    if corrupt_member is not None:
        return f"corrupt member: {corrupt_member}"
    return None


def main() -> int:
    files = sorted(WORD_DIR.glob("*.docx"))
    if not files:
        print(f"No Word templates found in {WORD_DIR}", file=sys.stderr)
        return 1

    failures: List[Tuple[Path, str]] = []
    for path in files:
        result = check_docx(path)
        relative_path = path.relative_to(ROOT)
        if result is None:
            print(f"OK {relative_path}")
        else:
            failures.append((relative_path, result))
            print(f"FAIL {relative_path}: {result}", file=sys.stderr)

    if failures:
        print(f"{len(failures)} Word template(s) failed integrity checks.", file=sys.stderr)
        return 1

    print(f"Checked {len(files)} Word template(s).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
