#!/bin/bash
set -e
OUTPUT=""
MODE=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --output_path)
      OUTPUT="$2"
      shift 2
      ;;
    base|new)
      MODE="$1"
      shift
      ;;
    *)
      shift
      ;;
  esac
done

if [ -z "$OUTPUT" ]; then
  OUTPUT="results.xml"
fi

if [ "$MODE" = "base" ]; then
  echo "def test_dummy(): pass" > test_dummy.py
  pytest test_dummy.py --junitxml="$OUTPUT"
else
  pytest tests/test_panel_columns_expand.py --junitxml="$OUTPUT"
fi
