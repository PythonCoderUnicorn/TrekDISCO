
# latest season 4 - episode 10 (Mar 5, 2022)

library(tidyverse)
library(rvest)

url = 'https://transcripts.foreverdreaming.org/viewtopic.php?f=987&t=64730'

trek = read_html(url)

words = trek %>% html_elements('.postbody') %>% html_text2() %>% 
  str_remove_all(pattern = "push") %>% 
  str_replace_all("window.adsbygoogle", replacement = "") %>% 
  str_replace_all("adsbygoogle", replacement = "") %>%
  str_remove_all("Transcripts Topic Top") %>% 
  str_remove_all("[:punct:]") %>% 
  str_remove_all("[:symbol:]")

# words

write_file(words,  path = './season4/disco4-10.txt')


