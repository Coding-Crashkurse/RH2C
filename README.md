# RH2C - R HTML2Canvas

### This R Package is a wrapper for the html2canvas JavaScript library. It allows you create screenshots without dependecies like PhantomJS.

### How to use the package:

1. `devtools::install_github("Data-Mastery/RH2C")`
2. `html2canvas::runExample()`

This will open an R-Shiny app with creates a screenshot of an HTML element which is selected by it´s ID. <br>
The function requires an `id`, `label`, and `selector` parameter, you can also change the `background` and `color` parameter, which use black and white as default values.

