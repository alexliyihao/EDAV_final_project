library(shiny)
library(tm)
library(wordcloud)
library(memoise)

Years <<- list("2019" = "matrix_2019.RData",
               "2018" = "matrix_2018.RData",
               "2017" = "matrix_2017.RData",
               "2016" = "matrix_2016.RData",
               "2015" = "matrix_2015.RData",
               "2014" = "matrix_2014.RData",
               "2013" = "matrix_2013.RData",
               "2012" = "matrix_2012.RData",
               "2011" = "matrix_2011.RData",
               "2010" = "matrix_2010.RData",
               "2009" = "matrix_2009.RData"
               )

getTermMatrix <- memoise(function(year) {
  if (!(year %in% Years))
    stop("Unknown year")
  data <- get(load(year))
  data
})

