## Credits
## Helveston (2021, March 25). jhelvy.com: Customizing distill with {htmltools} and CSS. Retrieved from https://www.jhelvy.com/posts/2021-03-25-customizing-distill-with-htmltools-and-css/
## https://github.com/jhelvy/jhelvy_distill/tree/master

library(htmltools)
library(distilltools)
library(stringr)
library(dplyr)

create_footer <- function() {
  
  fill <- '#ededeb'
  height <- '14px'
  
  footer <- HTML(paste0(
    '© 2023 Alex John Quijano [CC-BY-NC](https://creativecommons.org/licenses/by-sa/4.0/)\n',
    br(),
    ' Made with ','[R](https://cran.r-project.org/) ', ' and ',
    '[Distill for R Markdown](https://rstudio.github.io/distill/) \n',
    br(),
    last_updated(), "\n\n",
    
    '<!-- Add function to open links to external links in new tab, from: -->',
    '<!-- https://yihui.name/en/2018/09/target-blank/ -->\n\n',
    '<script src="js/external-link.js"></script>'
  ))
  
  save_raw(footer, "_footer.html")
}

last_updated <- function() {
  return(span(
    paste0(
      'Last updated on ',
      format(Sys.Date(), format="%B %d, %Y")
    ),
    style = "font-size:0.8rem;")
  )
}

save_raw <- function(text, path) {
  fileConn <- file(path)
  writeLines(text, fileConn)
  close(fileConn)
}
