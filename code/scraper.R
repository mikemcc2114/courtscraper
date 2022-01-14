library(tidyverse)
library(rvest)
library(pdftools)

url_numbers <- c('328630', '328640', '328650')
url_template <- 'https://courts.delaware.gov/Opinions/Download.aspx?id='

url_listing <- paste0(url,url_numbers)
url_listing
data_listing <- paste0('data/', url_numbers)
data_listing

scraper <- function(url_numbers) {
  url <- paste0(url_template, url_numbers)
  destfile <- paste0('data/', url_numbers)
  download.file(url, destfile, mode = "wb")
  pdf_text(destfile)
}


filings <- map_dfr(url_numbers, scraper, .id = url_numbers)
filings

### error here: "Error: Argument 1 must have names."
### scraper will download the data and save it to directory, but won't
### create dataframe that combines all downloads

#following this guide:
#https://community.rstudio.com/t/scraping-multiple-web-pages-with-rvest-and-for-loop/89661/2

### learn how to incorporate "polite" best practices? youtube video?
### https://cran.r-project.org/web/packages/polite/polite.pdf

txt1 <- pdf_text("data/328630")

