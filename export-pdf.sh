#!/bin/sh
# Rebuild the CV PDF from cv.html with Google Chrome (headless).
# Usage: sh export-pdf.sh   (run from anywhere)
set -e
HERE="$(cd "$(dirname "$0")" && pwd)"
OUT="$HERE/Abdul-Musavir-UC-CV.pdf"
"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
  --headless=new --disable-gpu --no-pdf-header-footer --no-first-run \
  --user-data-dir="$(mktemp -d)" --virtual-time-budget=4000 \
  --print-to-pdf="$OUT" "file://$HERE/cv.html" >/dev/null 2>&1
echo "Saved $OUT"
