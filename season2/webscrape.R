
# episode 1 -- season 2

library(tidyverse)
library(rvest)


trek = read_html('https://transcripts.foreverdreaming.org/viewtopic.php?f=987&t=54700')

words = trek %>% html_elements('.postbody') %>% html_text2()
words
