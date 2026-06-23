# =============================================================================
# server.R — Title SVG/PNG Generator (Japanese Google Fonts)
# =============================================================================
# Depends on objects from global.R: i18n, jp_fonts_db, HEX_RE.
# Depends on helper functions auto-sourced from R/: ensure_font (used inside
# build_title), build_title, pick_lang_text.
# =============================================================================

server <- function(input, output, session) {
  # Switch the app language when the EN/IT selector changes
  observeEvent(input$selected_language, {
    shiny.i18n::update_lang(input$selected_language)
  })

  output$char_warning <- renderText({
    char_count <- nchar(trimws(input$text), type = "chars")
    if (char_count > 28) {
      sprintf(
        i18n$t(
          "Limit is 28 characters — only the first 28 will be used (you typed %d)."
        ),
        char_count
      )
    } else {
      ""
    }
  })

  # Keep the font dropdown in sync with the selected category filter(s)
  observeEvent(
    input$category_filter,
    {
      selected_cats <- input$category_filter
      avail_fonts <- if (length(selected_cats) == 0) {
        character(0)
      } else {
        jp_fonts_db$font[jp_fonts_db$category %in% selected_cats]
      }

      current <- isolate(input$font)
      new_selected <- if (length(current) && current %in% avail_fonts) {
        current
      } else if (length(avail_fonts) > 0) {
        avail_fonts[1]
      } else {
        NULL
      }

      updateSelectInput(
        session,
        "font",
        choices = avail_fonts,
        selected = new_selected
      )
    },
    ignoreNULL = FALSE
  )

  # Purpose / impression panel for the currently selected font, shown in
  # whichever language is currently selected (falls back to English if a
  # purpose_it / impression_it cell is missing or blank for that row).
  output$font_info <- renderUI({
    req(input$font)
    info <- jp_fonts_db[jp_fonts_db$font == input$font, ]
    if (nrow(info) == 0) {
      return(NULL)
    }

    lang <- if (!is.null(input$selected_language)) {
      input$selected_language
    } else {
      "en"
    }

    tagList(
      tags$p(tags$strong(i18n$t("Category: ")), info$category[1]),
      tags$p(
        tags$strong(i18n$t("Purpose: ")),
        pick_lang_text(info, "purpose", lang)
      ),
      tags$p(
        tags$strong(i18n$t("Impression: ")),
        pick_lang_text(info, "impression", lang)
      )
    )
  })

  title_data <- reactive({
    validate(need(
      length(input$font) > 0 && nchar(input$font) > 0,
      i18n$t("Select at least one font category to choose a font.")
    ))
    validate(need(
      nchar(trimws(input$text)) > 0,
      i18n$t("Please enter some text.")
    ))
    validate(need(
      grepl(HEX_RE, input$color),
      i18n$t("Font color must be a valid hex code, e.g. #FF0000")
    ))
    if (nchar(trimws(input$bgcolor)) > 0) {
      validate(need(
        grepl(HEX_RE, input$bgcolor),
        i18n$t(
          "Background color must be a valid hex code, e.g. #FFFFFF, or left blank"
        )
      ))
    }
    build_title(
      input$text,
      input$font,
      input$fontsize,
      input$fontface,
      input$color,
      input$bgcolor
    )
  })

  output$preview <- renderPlot(
    {
      title_data()$plot
    },
    bg = "transparent"
  )

  output$download <- downloadHandler(
    filename = function() {
      paste0("title_", format(Sys.time(), "%Y%m%d_%H%M%S"), ".", input$filetype)
    },
    content = function(file) {
      td <- title_data()

      if (input$filetype == "svg") {
        svglite::svglite(file, width = td$width, height = td$height)
      } else if (requireNamespace("ragg", quietly = TRUE)) {
        ragg::agg_png(
          file,
          width = td$width,
          height = td$height,
          units = "in",
          res = 300,
          background = "transparent"
        )
      } else {
        grDevices::png(
          file,
          width = td$width,
          height = td$height,
          units = "in",
          res = 300,
          bg = "transparent"
        )
      }

      print(td$plot)
      dev.off()
    }
  )
}
