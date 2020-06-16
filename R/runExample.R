#' Run html2canvas example
#' Launches
#' to experiment with.
#' @export
runExample <- function() {
  appDir <- system.file("example", package = "html2canvas")
  shiny::runApp(appDir, display.mode = "normal")
}
