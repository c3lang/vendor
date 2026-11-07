#!/usr/bin/env python3
import argparse
import datetime
import hashlib
import json
import sys
from pathlib import Path

NAMESPACE = "c3lang"
REPO = "c3lang/vendor"
BASE_DIR = Path(__file__).resolve().parent
LIBRARIES_DIR = BASE_DIR / "libraries"
TEMP_DIR = BASE_DIR / "temp"


def sha256_file(path: Path) -> str:
    h = hashlib.sha256()
    with open(path, "rb") as f:
        while chunk := f.read(65536):
            h.update(chunk)
    return h.hexdigest()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--registry-dir",
        type=Path,
        default=BASE_DIR / "registry",
        help="Target directory for registry files",
    )
    args = parser.parse_args()

    registry_dir = args.registry_dir
    info_dir = registry_dir / "info" / NAMESPACE
    index_file = registry_dir / "index.json"

    info_dir.mkdir(parents=True, exist_ok=True)
    now = datetime.datetime.now(datetime.timezone.utc).isoformat()

    index_data = {"libraries": []}
    if index_file.exists():
        try:
            with open(index_file, "r", encoding="utf-8") as f:
                index_data = json.load(f)
        except Exception as e:
            print(f"Warning: could not parse existing index.json: {e}", file=sys.stderr)
            index_data = {"libraries": []}

    index_map = {lib.get("library") or lib.get("name"): lib for lib in index_data.get("libraries", [])}

    for c3l_dir in sorted(LIBRARIES_DIR.glob("*.c3l")):
        if not c3l_dir.is_dir():
            continue

        manifest_file = c3l_dir / "manifest.json"
        if not manifest_file.exists():
            print(f"Error: {c3l_dir.name} is missing manifest.json", file=sys.stderr)
            sys.exit(1)

        with open(manifest_file, "r", encoding="utf-8") as f:
            manifest = json.load(f)

        name = manifest.get("provides")
        version = manifest.get("version")

        if not name or not version:
            print(
                f"Error: {manifest_file} must define both 'provides' and 'version'",
                file=sys.stderr,
            )
            sys.exit(1)

        description = manifest.get("description", "")
        tags = manifest.get("tags", [])

        c3l_archive = TEMP_DIR / f"{c3l_dir.name}"
        if not c3l_archive.exists():
            print(f"Error: Archive {c3l_archive} does not exist", file=sys.stderr)
            sys.exit(1)

        checksum = f"sha256:{sha256_file(c3l_archive)}"
        size = c3l_archive.stat().st_size
        download_url = f"https://github.com/{REPO}/releases/download/{name}-v{version}/{name}.c3l"

        info_file = info_dir / name
        info_data = {
            "library": f"{NAMESPACE}/{name}",
            "description": description,
            "latest": version,
            "updated": now,
            "tags": tags,
            "versions": {},
        }

        if info_file.exists():
            try:
                with open(info_file, "r", encoding="utf-8") as f:
                    existing = json.load(f)
                    info_data["versions"] = existing.get("versions", {})
                    info_data["updated"] = existing.get("updated", now)
                    info_data["latest"] = existing.get("latest", version)
            except Exception:
                pass

        info_data["description"] = description
        info_data["tags"] = tags

        if version not in info_data["versions"]:
            info_data["versions"][version] = {
                "url": download_url,
                "checksum": checksum,
                "size": size,
                "published": now,
            }
            info_data["updated"] = now
            info_data["latest"] = version

        with open(info_file, "w", encoding="utf-8") as f:
            json.dump(info_data, f, indent=2)

        lib_id = f"{NAMESPACE}/{name}"
        index_map[lib_id] = {
            "library": lib_id,
            "description": description,
            "latest": info_data["latest"],
            "updated": info_data["updated"],
            "tags": tags,
            "versions": sorted(list(info_data["versions"].keys())),
        }

    index_data["libraries"] = sorted(list(index_map.values()), key=lambda x: x["library"])
    with open(index_file, "w", encoding="utf-8") as f:
        json.dump(index_data, f, indent=2)


if __name__ == "__main__":
    main()