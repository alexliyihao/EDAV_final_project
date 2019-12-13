library(tm)
library(wordcloud)
library(memoise)

nyc_data = read.csv("cleaned_nyc_data.csv")
word = nyc_data$amenities

# Using "memoise" to automatically cache the results
getTermMatrix <- memoise(function(text) {
  myCorpus = Corpus(VectorSource(text))
  toSpace <- content_transformer(function (x , pattern) gsub(pattern, " ", x))
  myCorpus <- tm_map(myCorpus, toSpace, "/")
  myCorpus <- tm_map(myCorpus, toSpace, ",")
  myCorpus <- tm_map(myCorpus, toSpace, "'")
  myCorpus = tm_map(myCorpus, content_transformer(tolower))
  myCorpus = tm_map(myCorpus, removePunctuation)
  myCorpus = tm_map(myCorpus, removeNumbers)
  myCorpus = tm_map(myCorpus, removeWords,
                    c(stopwords("SMART"), "english", "friendly", "thee", "the", "and", "but"))
  
  myDTM = TermDocumentMatrix(myCorpus,
                             control = list(minWordLength = 1))
  
  m = as.matrix(myDTM)
  
  sort(rowSums(m), decreasing = TRUE)
})

