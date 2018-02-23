library(knitr)
my.jekyll.site <- "/Users/pauloldham17inch/poldham.github.io"
KnitPost <- function(input, base.url = my.jekyll.site) {
  opts_knit$set(base.url = base.url)
  fig.path <- paste0("images/", sub(".Rmd$", "", basename(input)), "/")
  opts_chunk$set(fig.path = fig.path)
  opts_chunk$set(fig.cap = "center")
  render_jekyll()
  knit(input, envir = parent.frame())
}

##Code courtesy of Jerid Francom
