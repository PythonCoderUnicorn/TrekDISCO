
library(tidyverse)
library(tidytext)


disco2 = read.delim2(file = "./season2/disco2-2.txt", header = F)

disco2

disco3 = as.character(disco2)  

disco3

write_delim(disco2, path  = "./season2/disco2-2_.txt")

.