Sys.setenv(RETICULATE_USE_MANAGED_VENV="true")

library(dbplyr)

# Early check for OpenAI API Key
if (!nzchar(Sys.getenv("OPENAI_API_KEY"))) {
  stop(
    "No OpenAI API key found in Sys.getenv('OPENAI_API_KEY').",
    call. = FALSE
  )
}

ui <- quartohelp:::quartohelp_app_ui()
server <- quartohelp:::quartohelp_app_server()

shiny::shinyApp(ui, server)