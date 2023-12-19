## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

knitr::read_chunk(path = "../inst/plumber/capitalize/plumber.R",
                  from = 9,
                  labels = "capitalize")

## ----capitalize, eval = FALSE-------------------------------------------------
#  library(plumber)
#  library(plumbertableau)
#  
#  #* @apiTitle String utilities
#  #* @apiDescription Simple functions for mutating strings
#  
#  #* Capitalize incoming text
#  #* @tableauArg str_value:[character] Strings to be capitalized
#  #* @tableauReturn [character] A capitalized string(s)
#  #* @post /capitalize
#  function(str_value) {
#    toupper(str_value)
#  }
#  
#  # The Plumber router modifier tableau_extension is required. This object is a
#  # function that acts as a plumber router modifier. For more details, see the
#  # Plumber documentation:
#  # https://www.rplumber.io/articles/annotations.html#plumber-router-modifier
#  #* @plumber
#  tableau_extension

