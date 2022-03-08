
library(tidyverse)
library(tidytext)


disco2 = read.delim2(file = "./season2/disco2-14.txt", header = F)

write_delim(disco2, path  = "./season2/disco2-14_.txt")

# disco3 = as.character(disco2)
# 
# disco3