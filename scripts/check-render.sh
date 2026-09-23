#!/usr/bin/env bash
# check-render.sh — post-render acceptance checks for the Introduction to R deck
set -euo pipefail

OUT="${1:-_site/index.html}"

if [[ ! -f "$OUT" ]]; then
  echo "FAIL: $OUT not found — run quarto render first"; exit 1
fi

# --- Section IDs ---
# 00-title is deliberately absent: sections/00-title.qmd is not included by
# index.qmd, because the deck uses Quarto's own title slide from the front
# matter. This check had been failing on it.
for n in 00b-about \
         01-get-data 02-first-plot 03-transform 04-tidy \
         05-workflow 06-dates-ts 07-functions 08-iteration \
         09-capm 10-communicate 11-resources; do
  if ! grep -q "s${n}" "$OUT"; then
    echo "FAIL: missing section id s${n}"; exit 1
  fi
  echo "OK: s${n}"
done

# --- Demo slide IDs ---
# demo-ggplot-slide is absent for the same reason as 00-title: its source,
# sections/demo-ggplot.qmd, is no longer included by index.qmd. Both files are
# still on disk; if either is meant to be back, re-add the include AND the id
# here rather than just here.
for demo in demo-mutate-slide demo-filter-slide demo-pivot-longer-slide \
            demo-pivot-wider-slide \
            demo-first-plot-1 demo-first-plot-2 demo-first-plot-3 demo-first-plot-4; do
  if ! grep -q "$demo" "$OUT"; then
    echo "FAIL: missing demo id $demo"; exit 1
  fi
  echo "OK: $demo"
done

echo "All checks passed."
