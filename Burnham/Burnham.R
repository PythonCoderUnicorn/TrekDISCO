
#======== Text Mine Captain Burnham on Star Trek DISCO

# http://www.chakoteya.net/STDisco17/episodes.html    # season 1 only

# SEASON - EPISODE
# 1 - 1,2,3,4,5,6,7,8,9
# 1-10, 1-11, 1-12, 1-13, 1-14, 1-15


# burnhamSpeech1 = season 1



library(tidyverse)
library(stringi)
library(tidytext)
# install.packages('quanteda')
library(quanteda)


tdf = read.delim2(file = "./Burnham/burnhamSpeech1.txt", header = F)

qtdf = readtext::readtext('./Burnham/burnhamSpeech1.txt')

corpus('./Burnham/burnhamSpeech1.txt')


tdf = as.character(tdf)
qtdf = as.character(qtdf)

# tokenized
ttdf = tokens(tdf)

# keyword in context = search for word
kwic(ttdf, pattern = 'peace')
kwic(ttdf, pattern = 'Klingon', valuetype = 'regex')

# phrase = multi word
kwic(ttdf, pattern = phrase('Klingon') ) %>% head()




# tokenizing text
tqtdf = tokens(qtdf)

# remove punctuation
tokens(tqtdf, remove_punct = TRUE)

# tokens_compound()  # keeps multi-word together



#  document feature matrix, features = columns
# tolower() and remove punct() by default

qdfm = tqtdf %>% dfm()
qdfm

# remove English stop words
qdfm2 = tqtdf %>% dfm(remove= stopwords('english'), remove_punct= T)
qdfm2

qdfm2[ ,1:5]


# check stop words 
head( stopwords('en'), 10)

#  a list of the most frequently occurring features
topfeatures(qdfm2, 20) # top 20



# wordcloud
# install.packages("quanteda.textplots")
library("quanteda.textplots")

textplot_wordcloud(qdfm2, 
                   min_count = 6, 
                   random_color = FALSE, 
                   rotation = 0.25,
                   color = RColorBrewer::brewer.pal(8, 'PRGn')
                   )+ 
  theme(
    panel.background = element_rect(color = 'black')
  )



write_file(tdf, file = 'BurnhamSpeech2.txt')





dfm_sort(qdfm2)




# install.packages('quanteda.textstats')
library(quanteda.textstats)

qdfm2_freq = textstat_frequency(qdfm2, n=100)

# qdfm2_freq$feature = with(qdfm2_freq, reorder(feature, -frequency))



library(showtext)

# ====== load fonts from Google
# font_add_google(family = "Poppins","Poppins")
# # font_add_google(family = 'Lato','Lato')
# showtext_auto()
# 
# # load font installed on computer into RStudio
# font_add(family = "Montserrat", regular = "Montserrat-Regular.ttf")
# showtext_auto()

font_add_google('Oswald','Oswald')
showtext_auto()


qdfm2_freq %>% 
  filter(frequency > 15) %>% 
  ggplot(
       aes(y= fct_reorder( feature, frequency), x= frequency, fill= frequency ) # fct_reorder( feature, frequency)
       )+
  # geom_point()+
  geom_col()+
  ggdark::dark_mode()+
  scale_fill_viridis_c(option = 'C')+
  labs(title = "\nStar Trek Disco Captain Burnham",
       subtitle = "Season 1 :: word frequencies > 15",
       x="word frequency",
       y="word"
       )+
  theme(
    text =  element_text(family = 'Oswald'),
    plot.title = element_text(size = 15, hjust = 0.5),
    plot.subtitle = element_text(size = 14, hjust = 0.5),
    axis.text.y = element_text(size = 12, face = 'bold', color = 'white'),
    axis.text.x = element_text(size = 12, color = 'white'),
    axis.title = element_text(size=14, color = 'white')
  )


.









