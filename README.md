# Title SVG/PNG Generator — Japanese Google Fonts

A Shiny app for generating short title images (SVG or PNG) using Japanese
Google Fonts, with an EN/IT interface and SATOM branding via `brand.yml`.

## Project structure

```
.
├── global.R              # packages, options, loads i18n + font database
├── ui.R                  # UI definition
├── server.R               # server logic
├── R/                     # helper functions — auto-sourced by Shiny, no
│   ├── fonts.R             #   need to source() these yourself
│   ├── title_builder.R
│   └── i18n_helpers.R
├── data/
│   ├── jp_fonts_database.csv   # font, category, purpose, impression
│   │                            # (+ optional purpose_it, impression_it)
│   └── translation.json        # EN/IT dictionary for the UI text
├── _brand.yml             # SATOM colors/fonts/logo for the app's Bootstrap theme
├── logos/                 # image files referenced by _brand.yml
└── README.md
```

Shiny automatically discovers the `global.R` / `ui.R` / `server.R` triple,
and (since Shiny 1.5.0) auto-sources every top-level `.R` file in `R/` —
no `source()` calls needed anywhere.

## Setup

```r
install.packages(c(
  "shiny", "bslib", "shiny.i18n", "ggplot2",
  "sysfonts", "showtext", "svglite"
))
install.packages("ragg")  # optional, nicer/faster PNG output

# shiny.info was removed from CRAN — install from GitHub:
install.packages("remotes")
remotes::install_github("Appsilon/shiny.info")
```

You'll also need:

- **`data/jp_fonts_database.csv`** — one row per font, with at minimum
  `font, category, purpose, impression` columns. Add `purpose_it` /
  `impression_it` columns to localize those two fields into Italian (any
  row missing them just falls back to the English text).
- **`data/translation.json`** — the EN/IT dictionary for every UI label,
  button, help line, and validation message.
- **`_brand.yml`** (app root) + the `logos/` folder it points to — used by
  `bslib`'s `bs_theme(brand = TRUE)` to theme the app's Bootstrap CSS
  (buttons, sliders, headings, links). This is unrelated to the Japanese
  fonts used in the generated image, which always come from the CSV.

## Running the app

```r
shiny::runApp("path/to/this/folder")
```

Or open any of `global.R` / `ui.R` / `server.R` in RStudio/Positron and use
the editor's "Run App" button — it auto-detects the three-file structure.

An internet connection is required while the app runs, since Japanese
Google Fonts are downloaded on first use (then cached for the session).

## Where to make common changes

| I want to... | Edit this |
|---|---|
| Add/remove a font, or its category/purpose/impression text | `data/jp_fonts_database.csv` |
| Add an Italian translation for a font's purpose/impression | add `purpose_it` / `impression_it` to the same CSV |
| Change wording of a label, button, or message | `data/translation.json` (add both `en` and `it` keys) |
| Change SATOM's brand colors / fonts / logo | `_brand.yml` |
| Change a control's behavior (sliders, validation, etc.) | `server.R` |
| Add a new input/output element | `ui.R` (and wire it up in `server.R`) |
| Change how the title image itself is drawn or sized | `R/title_builder.R` |
| Change Google Font download/caching logic | `R/fonts.R` |

## Known limitations

- Most Japanese Google Fonts ship only Regular/Bold — no italic — so the
  app only offers Plain/Bold.
- SVG export embeds glyph outlines (via `showtext`), so the text is no
  longer "real", editable SVG text — but it renders correctly even without
  the font installed on the viewer's machine.
- `purpose`/`impression` text in the CSV is data, not a UI label, so it's
  translated per-row via the `_it` columns above rather than through
  `translation.json`.
