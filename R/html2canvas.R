#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
html2canvas <- function(id, label, selector, background = "black", color = "white", width = NULL, height = NULL, elementId = NULL) {

  # forward options using x
  x = list(
    id = id,
    label = label,
    selector = selector,
    background = background,
    color = color
  )

  # create widget
  htmlwidgets::createWidget(
    name = 'html2canvas',
    x,
    width = width,
    height = height,
    package = 'html2canvas',
    elementId = elementId
  )
}

#' Shiny bindings for html2canvas
#'
#' Output and render functions for using html2canvas within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a html2canvas
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name html2canvas-shiny
#'
#' @export
html2canvasOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'html2canvas', width, height, package = 'html2canvas')
}

#' @rdname html2canvas-shiny
#' @export
renderHtml2canvas <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, html2canvasOutput, env, quoted = TRUE)
}


#' Run html2canvas example
#' Launches
#' to experiment with.
#' @export
runExample <- function() {
  appDir <- system.file("example", package = "html2canvas")
  shiny::runApp(appDir, display.mode = "normal")
}
