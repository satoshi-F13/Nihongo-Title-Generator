# =============================================================================
# R/title_builder.R — Build the ggplot title image + its canvas size
# =============================================================================
# Auto-sourced by Shiny from the R/ folder (no source() call needed).
# Used by both the live preview and the download handler in server.R, so the
# exported file always matches what's shown on screen.
# =============================================================================

#' Build a single-line title as a ggplot object, sized to fit the text.
#'
#' @param text Raw input text (trimmed and capped at 28 characters here).
#' @param font Google Font family name, already registered via ensure_font().
#' @param fontsize Font size in points.
#' @param fontface "plain" or "bold".
#' @param color Hex color string for the text.
#' @param bgcolor Hex color string for the background, or "" for transparent.
#' @return list(plot, width, height, text) — width/height are in inches.
build_title <- function(text, font, fontsize, fontface, color, bgcolor) {
  ensure_font(font)

  trimmed_text <- trimws(text)
  char_count <- nchar(trimmed_text, type = "chars")
  if (char_count > 28) {
    trimmed_text <- substr(trimmed_text, 1, 28)
  }
  display_text <- if (trimmed_text == "") " " else trimmed_text

  color <- if (grepl(HEX_RE, color)) color else "#000000"

  bg_blank <- is.null(bgcolor) || trimws(bgcolor) == ""
  bg_fill <- if (bg_blank) {
    NA
  } else if (grepl(HEX_RE, bgcolor)) {
    bgcolor
  } else {
    NA
  }

  # Rough canvas size: Japanese full-width glyphs are roughly square, so
  # approximate width by character count * font size, with some padding.
  n <- max(nchar(display_text), 1)
  width_in <- max(2, (n * fontsize * 1.15) / 72 + 0.6)
  height_in <- max(1, (fontsize * 1.9) / 72 + 0.4)

  p <- ggplot() +
    annotate(
      "text",
      x = 0.5,
      y = 0.5,
      label = display_text,
      family = font,
      fontface = fontface,
      size = fontsize * 0.352778, # pt -> mm, the unit ggplot2 text uses
      colour = color
    ) +
    xlim(0, 1) +
    ylim(0, 1) +
    theme_void() +
    theme(
      plot.background = element_rect(fill = bg_fill, colour = NA),
      panel.background = element_rect(fill = bg_fill, colour = NA)
    )

  list(plot = p, width = width_in, height = height_in, text = display_text)
}
