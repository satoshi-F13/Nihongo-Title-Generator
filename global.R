# =============================================================================
# global.R — Title SVG/PNG Generator (Japanese Google Fonts)
# =============================================================================
# Runs once when the app starts (shared across all sessions). Holds package
# loading, app-wide options, and the data that the UI/server need at build
# time: the i18n Translator and the Japanese font database.
#
# Helper functions live in R/ and are auto-sourced by Shiny (>= 1.5.0) — no
# source() calls needed. global.R itself is evaluated before the files in
# R/, so don't rely on R/ functions being available *during* global.R; it's
# fine for ui.R and server.R to use them, since those load after R/.
#
# REQUIRED PACKAGES (install once):
#   install.packages(c("shiny", "bslib", "shiny.i18n", "ggplot2", "sysfonts",
#                       "showtext", "svglite"))
#   install.packages("ragg")  # optional, nicer/faster PNG output
#   remotes::install_github("Appsilon/shiny.info")  # removed from CRAN
#
# REQUIRED FILES (see README.md for full details):
#   data/jp_fonts_database.csv   font, category, purpose, impression
#                                 (+ optional purpose_it, impression_it)
#   data/translation.json        EN/IT dictionary for shiny.i18n
#   _brand.yml                   app root, bslib (>= 0.9.0) Bootstrap theme
#   logos/...                    referenced by _brand.yml
#
# HOW TO RUN:
#   shiny::runApp("path/to/this/folder")
# =============================================================================

library(shiny)
library(bslib)
library(shiny.i18n)
library(ggplot2)
library(sysfonts)
library(showtext)
library(svglite)
library(brand.yml)
# Render text with showtext on every graphics device (preview + export)
showtext_auto()
showtext_opts(dpi = 300)

# Some proxies/firewalls make R's default download settings unreliable for
# fetching font files — these two lines fix the most common cases.
options(timeout = max(60, getOption("timeout", default = 60)))
if (.Platform$OS.type == "windows") {
  options(download.file.method = "libcurl")
}

VERSION <- "ver.0.1"

# ---- Internationalization (English / Italian) -----------------------------
# data/translation.json holds the EN/IT dictionary for every UI label, button,
# help line, and validation message. i18n$t("...") is used both in the static
# UI (translated instantly client-side, no reload) and inside server-side
# render*() calls (translated server-side, reactive to the language selector).
i18n <- shiny.i18n::Translator$new(
  translation_json_path = file.path("data", "translation.json")
)
i18n$set_translation_language("en") # default language shown on first load

# ---- Japanese Google Font database (category / purpose / impression) -----
# Expected CSV columns: font, category, purpose, impression
# Optional columns: purpose_it, impression_it — used by pick_lang_text() in
# R/i18n_helpers.R to show localized purpose/impression text when available.
font_db_path <- file.path("data", "jp_fonts_database.csv")

jp_fonts_db <- tryCatch(
  {
    df <- utils::read.csv(
      font_db_path,
      stringsAsFactors = FALSE,
      fileEncoding = "UTF-8"
    )
    required_cols <- c("font", "category", "purpose", "impression")
    missing_cols <- setdiff(required_cols, names(df))
    if (length(missing_cols) > 0) {
      stop(sprintf(
        "missing column(s): %s",
        paste(missing_cols, collapse = ", ")
      ))
    }
    df
  },
  error = function(e) {
    stop(sprintf(
      paste0(
        "Could not load '%s'. Make sure the file exists relative to the app's ",
        "working directory and has columns font/category/purpose/impression. (%s)"
      ),
      font_db_path,
      conditionMessage(e)
    ))
  }
)

jp_categories <- sort(unique(jp_fonts_db$category))

HEX_RE <- "^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$"
