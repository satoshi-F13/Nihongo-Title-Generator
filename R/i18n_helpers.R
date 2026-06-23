# =============================================================================
# R/i18n_helpers.R — Per-row translation lookup for the font database
# =============================================================================
# Auto-sourced by Shiny from the R/ folder (no source() call needed).
#
# The UI's labels/buttons/messages are translated via data/translation.json
# (see global.R's `i18n` object); this file handles the separate case of
# translating *data* — the purpose/impression text that comes from
# data/jp_fonts_database.csv.
# =============================================================================

#' Pick the language-specific value of a font-database column.
#'
#' Looks for `<base_col>_<lang>` (e.g. "purpose_it") and uses it if present
#' and non-blank; otherwise falls back to the English `<base_col>` column.
#'
#' @param info A one-row data.frame slice of jp_fonts_db.
#' @param base_col Base column name, e.g. "purpose" or "impression".
#' @param lang Language code, e.g. "en" or "it".
#' @return A single character value.
pick_lang_text <- function(info, base_col, lang) {
  base_val <- info[[base_col]][1]
  if (identical(lang, "en")) {
    return(base_val)
  }
  lang_col <- paste0(base_col, "_", lang)
  if (lang_col %in% names(info)) {
    lang_val <- info[[lang_col]][1]
    if (!is.na(lang_val) && nzchar(trimws(lang_val))) {
      return(lang_val)
    }
  }
  base_val
}
