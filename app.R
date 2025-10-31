Sys.setenv(RETICULATE_USE_MANAGED_VENV="true")

library(dbplyr)

# Early check for OpenAI API Key
if (!nzchar(Sys.getenv("OPENAI_API_KEY"))) {
  stop(
    "No OpenAI API key found in Sys.getenv('OPENAI_API_KEY').",
    call. = FALSE
  )
}

store <- quartohelp:::quarto_ragnar_store()

ui <-  quartohelp:::quartohelp_chat_ui(NULL)
server <- quartohelp:::quartohelp_chat_server(
  store,
  client = function() {
    ellmer::chat_openai(model = "gpt-4.1") |>
      quartohelp:::quartohelp_setup_client(store)
  },
  close_action = "clear"
)

shiny::shinyApp(ui, server)