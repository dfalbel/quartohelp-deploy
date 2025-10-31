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
server <- quartohelp:::quartohelp_app_server(
  chat_factory = function() quartohelp::configure_chat(
    chat = ellmer::chat_openai(model = "gpt-4o")
  )
)

shiny::shinyApp(ui, server)