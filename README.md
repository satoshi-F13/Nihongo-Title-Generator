# Title SVG/PNG Generator — Japanese Google Fonts

A small Shiny app that turns a short phrase into a polished title image —
in any of dozens of Japanese Google Fonts — ready to drop into a slide,
website, package design, or printed document.

Built and maintained by [SATOM OÜ](https://satom.eu).

| | |
|---|---|
| **Output formats** | SVG, PNG |
| **Max title length** | 28 Japanese characters |
| **Interface languages** | English, Italian |
| **Built with** | R, Shiny, ggplot2, Google Fonts, bslib + brand.yml |

## Contents

- [Who is this for?](#who-is-this-for)
- [How to use the app](#how-to-use-the-app)
- [Features](#features)
- [Need Japanese proofreading?](#need-japanese-proofreading)
- [For developers / collaborators](#for-developers--collaborators)
- [License](#license)

## Who is this for?

Anyone who needs to drop a short Japanese title into a design, slide, or
document and isn't sure which font fits the mood — no fluency in Japanese
required. Type or paste your text, browse fonts by category, and use the
**purpose** and **impression** notes next to each font to pick one that
matches your brand (formal vs. casual, modern vs. traditional, playful vs.
elegant, and so on).

It's equally useful if you *do* read Japanese and just want a fast way to
preview and export a styled title without opening a design tool.

## How to use the app

1. **Pick your language.** EN / IT switcher, top-right.
2. **Type your title.** Up to 28 Japanese characters; a live counter warns
   you if you go over.
3. **Browse fonts.** Filter by category (you can select more than one),
   then pick a font from the dropdown. The panel below the preview shows
   that font's **purpose** (typical use cases) and **impression** (the
   mood it conveys) so you don't have to guess.
4. **Style it.** Set font size, weight (Plain/Bold), text color, and an
   optional background color — all as hex codes.
5. **Preview.** The image updates live as you adjust anything above.
6. **Download.** Choose SVG or PNG and click Download.

## Features

- 30+ Japanese Google Fonts, filterable by category
- Per-font guidance on intended use and visual impression
- Live, instant preview
- Export as SVG (scalable, ideal for print/design tools) or PNG
- English / Italian interface, switchable without reloading
- SATOM-branded styling throughout

## Need Japanese proofreading?

If you need a native check on Japanese wording — not just the typography —
[SATOM](https://satom.eu/contact) can help.

## For developers / collaborators

<details>
<summary>Click to expand: project structure, setup, and how to extend the app</summary>

### Project structure

```
.
├── global.R              # packages, options, loads i18n + font database
├── ui.R                  # UI definition
├── server.R              # server logic
├── R/                    # helper functions — auto-sourced by Shiny, no
│   ├── fonts.R            #   need to source() these yourself
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

