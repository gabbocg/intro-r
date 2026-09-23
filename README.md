# R for Empirical Finance

An introduction to R for finance students with no prior R, built as a Quarto /
reveal.js deck. Every example uses financial data — prices, returns, factor
models, CAPM — and R runs in the browser, so a reader can change a number and
re-run without installing anything.

**[View it →](https://gabbocg.github.io/intro-r/)**

## Running it

```bash
quarto render                  # builds _site/
quarto preview                 # live reload while editing
bash scripts/check-render.sh   # acceptance checks, run after every change
bash scripts/publish.sh        # render, check, deploy to GitHub Pages
```

Deploy with `scripts/publish.sh`, not `quarto publish gh-pages` — the latter
drops anything under `assets/vendor/` that is only referenced from inside
JavaScript, which then 404s on the deployed site while working fine locally.

## Layout

| path | what |
|---|---|
| `index.qmd` | front matter and the section includes |
| `sections/` | one file per topic |
| `data/` | committed CSVs, so the deck renders offline |
| `assets/theme.scss` | the deck's look |
| `assets/js/*.html` | one animated demo each |
| `assets/vendor/` | anime.js, vendored |
| `scripts/` | the checks, the data refresh and the deploy |
| `renv.lock` | the R library the deck was built against |
