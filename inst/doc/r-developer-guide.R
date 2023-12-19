## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

# Load package
library(plumbertableau)

# Set random seed
set.seed(35487)

# R chunks
knitr::read_chunk(path = "../inst/plumber/loess/plumber.R",
                  labels = "loess")

## ----eval = FALSE-------------------------------------------------------------
#  # from CRAN
#  install.packages("plumbertableau")
#  
#  # from GitHub
#  remotes::install_github("rstudio/plumbertableau")

## -----------------------------------------------------------------------------
plumber::available_apis(package = "plumbertableau")

## ----fig.width=6.5, fig.height=4.5--------------------------------------------
x <- seq(1, 10, length.out = 100)
y <- 1/x^2 + rnorm(length(x), sd = 0.05)
fit <- loess(y ~ x, span = 0.75)
y_fit <- predict(fit, data.frame(x, y))

# Plot the data and prediction.
plot(x, y)
lines(x, y_fit)

## ----loess, eval = FALSE------------------------------------------------------
#  library(plumber)
#  library(plumbertableau)
#  
#  #* @apiTitle Loess Smoothing
#  #* @apiDescription Loess smoothing for Tableau
#  
#  #* Fit a loess curve to the inputs and return the curve values
#  #* @param alpha Degree of smoothing
#  #* @tableauArg x:integer X values for fitting
#  #* @tableauArg y:numeric Y values for fitting
#  #* @tableauReturn numeric Fitted loess values
#  #* @post /predict
#  function(x, y, alpha = 0.75) {
#    alpha <- as.numeric(alpha)
#    l_out <- loess(y ~ x, span = alpha)
#    predict(l_out, data.frame(x, y))
#  }
#  
#  #* @plumber
#  tableau_extension

## ----eval = FALSE-------------------------------------------------------------
#  #* Annotate me!
#  function(x, y, alpha = 0.75) {
#    alpha <- as.numeric(alpha)
#    l_out <- loess(y ~ x, span = alpha)
#    predict(l_out, data.frame(x, y))
#  }

## ----eval=FALSE---------------------------------------------------------------
#  #* @tableauArg x:integer X values for fitting
#  #* @tableauArg y:numeric Y values for fitting

## ----eval=FALSE---------------------------------------------------------------
#  #* @tableauArg y:numeric? Y values for fitting
#  
#  **Data returned to Tableau** is described with `@tableauReturn`. The syntax is similar to `@tableauArg`, without an argument name: `#* @tableauReturn Type Description`.
#  

## ----eval=FALSE---------------------------------------------------------------
#  #* @tableauReturn numeric Fitted loess values

## ----eval=FALSE---------------------------------------------------------------
#  #* @param alpha Degree of smoothing

## ----eval = FALSE-------------------------------------------------------------
#  #* @plumber
#  tableau_extension

## -----------------------------------------------------------------------------
mock_tableau_request(script = "/predict", 
             data = mtcars[,c("hp", "mpg")])

