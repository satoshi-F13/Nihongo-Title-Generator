# =============================================================================
# R/fonts.R — Google Font loading for Japanese typefaces
# =============================================================================
# Auto-sourced by Shiny from the R/ folder (no source() call needed).
# Downloads a Google Font on first use and caches it for the rest of the app
# session so each font is only fetched once.
# =============================================================================

loaded_fonts <- new.env()

#' Make sure a Google Font is registered with sysfonts/showtext.
#'
#' @param font_name Exact Google Fonts family name (e.g. "Noto Sans JP").
#' @return invisible(TRUE) on success; stops with the underlying download
#'   error message on failure.
ensure_font <- function(font_name) {
  if (!isTRUE(loaded_fonts[[font_name]])) {
    err_msg <- NULL

    ok <- tryCatch(
      {
        sysfonts::font_add_google(
          name = font_name,
          family = font_name,
          regular.wt = 400,
          bold.wt = 700
        )
        TRUE
      },
      error = function(e) {
        err_msg <<- conditionMessage(e)
        FALSE
      }
    )

    if (!ok) {
      # Some Japanese fonts only ship a single weight — retry without bold
      ok <- tryCatch(
        {
          sysfonts::font_add_google(
            name = font_name,
            family = font_name,
            regular.wt = 400
          )
          TRUE
        },
        error = function(e) {
          err_msg <<- conditionMessage(e)
          FALSE
        }
      )
    }

    if (!ok) {
      stop(sprintf(
        "Could not load Google Font '%s'. Underlying error: %s",
        font_name,
        err_msg
      ))
    }
    loaded_fonts[[font_name]] <- TRUE
  }
  invisible(TRUE)
}
