# =============================================================================
# ui.R — Title SVG/PNG Generator (Japanese Google Fonts)
# =============================================================================
# Depends on objects created in global.R: i18n, jp_fonts_db, jp_categories.
# Depends on shiny.info + _brand.yml for the footer/branding elements below.
# =============================================================================

ui <- fluidPage(
  theme = bs_theme(version = 5, brand = TRUE),
  shiny.i18n::usei18n(i18n),

  # EN / IT switcher, pinned to the top-right corner of the page
  div(
    style = "position: absolute; top: 12px; right: 18px; z-index: 1050; width: 90px;",
    selectInput(
      "selected_language",
      label = NULL,
      choices = c("EN" = "en", "IT" = "it"),
      selected = "en"
    )
  ),

  titlePanel(i18n$t("Title SVG / PNG Generator — Japanese Google Fonts")),

  shiny.info::info_panel(
    # shiny.info::git_info(),
    shiny.info::powered_by("SATOM OÜ", link = "https://satom.eu"),
    position = "bottom left"
  ),

  shiny.info::version(),

  sidebarLayout(
    sidebarPanel(
      textAreaInput(
        "text",
        i18n$t("Title text (max 28 Japanese characters)"),
        value = "Input Japanse texts",
        rows = 2
      ),
      textOutput("char_warning"),
      tags$br(),
      selectizeInput(
        "category_filter",
        i18n$t("Font category (multiple selection)"),
        choices = jp_categories,
        selected = jp_categories,
        multiple = TRUE
      ),
      selectInput(
        "font",
        i18n$t("Japanese Google Font"),
        choices = jp_fonts_db$font,
        selected = if ("Noto Sans JP" %in% jp_fonts_db$font) {
          "Noto Sans JP"
        } else {
          jp_fonts_db$font[1]
        }
      ),
      sliderInput(
        "fontsize",
        i18n$t("Font size (pt)"),
        min = 10,
        max = 200,
        value = 60,
        step = 1
      ),
      radioButtons(
        "fontface",
        i18n$t("Font face"),
        choiceNames = list(i18n$t("Plain"), i18n$t("Bold")),
        choiceValues = list("plain", "bold"),
        selected = "plain",
        inline = TRUE
      ),
      textInput("color", i18n$t("Font color (hex)"), value = "#000000"),
      textInput(
        "bgcolor",
        i18n$t("Background color (hex, blank = transparent)"),
        value = ""
      ),
      radioButtons(
        "filetype",
        i18n$t("File type"),
        choices = c("PNG" = "png", "SVG" = "svg"), # universal acronyms, left untranslated
        selected = "png",
        inline = TRUE
      ),
      downloadButton("download", i18n$t("Download")),
      tags$hr(),
      helpText(
        i18n$t("Most Japanese Google Fonts have no italic style, so only"),
        i18n$t("Plain / Bold are offered here. The first time you pick a"),
        i18n$t("font it is downloaded from Google Fonts, so this needs an"),
        i18n$t("internet connection.")
      )
    ),
    mainPanel(
      plotOutput("preview", height = "320px"),
      tags$hr(),
      uiOutput("font_info"),
      uiOutput("contact_info")
    )
  )
)
