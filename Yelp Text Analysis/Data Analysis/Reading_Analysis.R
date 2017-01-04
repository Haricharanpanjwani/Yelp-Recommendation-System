#install.packages("RJSONIO")
#install.packages("qdap")
library(rjson)
library(irlba)
library(RJSONIO)
library(tidyr)
library(stringr)
setwd("C:/Users/Sanath/Desktop/Output")

Lines <- readLines("review.json") 
reviewData <- as.data.frame(t(sapply(Lines, fromJSON)))
#View(as.data.frame(reviewData))
rownames(reviewData) <- 1:nrow(reviewData)
reviewData$stars <- as.numeric(reviewData$stars)  

serviceWords <- read.table(file = "serviceWords.txt", header = FALSE, sep = " ")
nrow(serviceWords)
punct <- '[]\\?!\"\'#%&(){}+*/:;,._`|~\\[<=>@\\^-]'
reviewData$text <- gsub(punct,"",reviewData$text)  
trim <- function (x) gsub("^\\s+|\\s+$", "", x)
reviewData$text <- trim(reviewData$text) 
reviewData$text <- gsub("\\s+", " ", str_trim(reviewData$text))

newData <- reviewData
newData <- newData[c("business_id","user_id","stars","text")]
newData$business_id <- as.character(newData$business_id)
newData$user_id <- as.character(newData$user_id)
View(newData)
write.table(newData,file = "business_json.txt", row.names = F)
drops <- c("votes","review_id","date","type")
newData <- reviewData[ , !(names(reviewData) %in% drops)]
#View(newData)
splitDF <- split(newData , f = rep_len(1:5, nrow(newData) ) )
#x <- reviewData[ , !(names(reviewData) %in% drops)]
#x[c("business_id","user_id","stars","text")]
#x <- as.matrix(x)
#View(x)
#View(as.data.frame(reviewData$text))
#write.table(x, file = "reviewData_rev.txt",row.names = F,col.names = F,sep = "/t")
nrow(y)
y <- newData

a <- "ABC"
a.low


count = 0
for(i in 1 : nrow(y)){
  #review = splitDF$`1`$text[i]
  review <- unlist(strsplit(y$text[i]," "))
  for( j in 1 : nrow(serviceWords)){
  
    if(serviceWords$V1[j] %in% review){
      count = count + 1
      y$swScore[i] <- y$stars[i]
      y$numWords[i] <- length(unlist(strsplit(review," ")))
    }
  }
  #print(count)  
  if(count == 0){
    y$swScore[i] <- y$stars[i] * -1
    y$numWords[i] <- length(unlist(strsplit(review," ")))
  }
  else{
    count = 0
  }
}

View(y)
SW3 <- y
str(SW3)
class(y$swScore)
for(i in 1:nrow(y)){
  if(y$swScore[i] < 0){
    y$sign[i] <- -1
  }
  else{
    y$sign[i] <- 1
  }
}
y$user_id <- as.character(y$user_id)
y$business_id <- as.character(y$business_id)

y <- y[c("business_id","user_id","stars","swScore","numWords","sign","text")]
write.table(y,file="rrSW3.txt", row.names = F )

wordList <- df[FALSE]
wordList$words
abc <- y
# Creating wordlist

n <- 10000
nr <- nrow(abc)
splitDF <- split(abc, rep(1:ceiling(nr/n), each=n, length.out=nr))

temp <- vector()
wordList <- vector()

###########################################################################
for(i in 1 :nrow(splitDF$`1`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`1`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 1")
safety_wordList1 <- wordList
length(wordList)

for(i in 1 :nrow(splitDF$`2`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`2`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 2")
safety_wordList2 <- wordList
length(safety_wordList2)
wordList <- unique(safety_wordList2)
length(wordList)

for(i in 1 :nrow(splitDF$`3`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`3`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 3")
safety_wordList3 <- wordList
length(safety_wordList3)
wordList <- unique(safety_wordList3)
length(wordList)

for(i in 1 :nrow(splitDF$`4`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`4`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 4")
safety_wordList4 <- wordList
length(safety_wordList4)
wordList <- unique(safety_wordList4)
length(wordList)


for(i in 1 :nrow(splitDF$`5`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`5`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 5")
safety_wordList5 <- wordList
length(safety_wordList5)
wordList <- unique(safety_wordList5)
length(wordList)

for(i in 1 :nrow(splitDF$`6`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`6`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 6")
safety_wordList6 <- wordList
length(safety_wordList6)
wordList <- unique(safety_wordList6)
length(wordList)

for(i in 1 :nrow(splitDF$`7`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`7`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 7")
safety_wordList7 <- wordList
length(safety_wordList7)
wordList <- unique(safety_wordList7)
length(wordList)


for(i in 1 :nrow(splitDF$`8`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`8`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 8")
safety_wordList8 <- wordList
length(safety_wordList8)
wordList <- unique(safety_wordList8)
length(wordList)


for(i in 1 :nrow(splitDF$`9`)){
    temp <- NULL
    temp<- unlist(strsplit(splitDF$`9`$text[i]," "))
    wordList <- c(wordList,temp)
}
print("Completed 9")
safety_wordList9 <- wordList
wordList <- safety_wordList9
length(safety_wordList9)
wordList <- unique(safety_wordList9)
length(wordList)
#########################################################

for(i in 1 :nrow(splitDF$`10`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`10`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 10")
safety_wordlist10 <- wordList
length(safety_wordlist10)
wordList <- unique(safety_wordlist10)
length(wordList)

for(i in 1 :nrow(splitDF$`11`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`11`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 11")
safety_wordlist11 <- wordList
length(safety_wordlist11)
wordList <- unique(safety_wordlist11)
length(wordList)


for(i in 1 :nrow(splitDF$`12`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`12`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 12")
safety_wordlist12 <- wordList
length(safety_wordlist12)
wordList <- unique(safety_wordlist12)
length(wordList)


for(i in 1 :nrow(splitDF$`13`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`13`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 13")
safety_wordlist13 <- wordList
length(safety_wordlist13)
wordList <- unique(safety_wordlist13)
length(wordList)

#################################################################3333
for(i in 1 :nrow(splitDF$`14`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`14`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 14")
safety_wordlist14 <- wordList
length(safety_wordlist14)
wordList <- unique(safety_wordlist14)
length(wordList)


for(i in 1 :nrow(splitDF$`15`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`15`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 15")
safety_wordlist15 <- wordList
length(safety_wordlist15)
wordList <- unique(safety_wordlist15)
length(wordList)


for(i in 1 :nrow(splitDF$`16`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`16`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 16")
safety_wordlist16 <- wordList
length(safety_wordlist16)
wordList <- unique(safety_wordlist16)
length(wordList)


for(i in 1 :nrow(splitDF$`17`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`17`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 17")
safety_wordlist17 <- wordList
length(safety_wordlist17)
wordList <- unique(safety_wordlist17)
length(wordList)

for(i in 1 :nrow(splitDF$`18`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`18`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 18")
safety_wordlist18 <- wordList
length(safety_wordlist18)
wordList <- unique(safety_wordlist18)
length(wordList)

for(i in 1 :nrow(splitDF$`19`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`19`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 19")
safety_wordlist19 <- wordList
length(safety_wordlist19)
wordList <- unique(safety_wordlist19)
length(wordList)



for(i in 1 :nrow(splitDF$`20`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`20`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 20")
safety_wordlist20 <- wordList
length(safety_wordlist20)
wordList <- unique(safety_wordlist20)
length(wordList)



for(i in 1 :nrow(splitDF$`21`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`21`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 21")
safety_wordlist21 <- wordList
length(safety_wordlist21)
wordList <- unique(safety_wordlist21)
length(wordList)


for(i in 1 :nrow(splitDF$`22`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`22`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 22")
safety_wordlist22 <- wordList
length(safety_wordlist22)
wordList <- unique(safety_wordlist22)
length(wordList)


for(i in 1 :nrow(splitDF$`23`)){
  temp <- NULL
  temp<- unlist(strsplit(splitDF$`23`$text[i]," "))
  wordList <- c(wordList,temp)
}
print("Completed 23")
safety_wordlist23 <- wordList
length(safety_wordlist23)
wordList <- unique(safety_wordlist23)
length(wordList)


fianl_wordList <- unique(wordList)
length(fianl_wordList)

wordList <- as.data.frame(wordList)
View(wordList)

View(table(wordList_DF))

write.table(wordList, file = "new_wordlist.txt",row.names = F)
wordList_DF <- read.table("new_wordlist.txt",header = T)
View(wordList_DF)
temp_wordList_DF <- wordList_DF 
a=0 
b= 0
c=0
d=0
e=0
for(i in 1:nrow(temp_wordList_DF)){
  print("For OuterLoop")
  print(i)
  for(j in 1:nrow(y)){
    print("InnerLoop")
    print(j)
    review <- unlist(strsplit(y$text[j]," "))
    if(temp_wordList_DF[i] %in% review){
      star <- y$stars
      
      if(star == 1){
        a= a+1
      }
      else if(star == 2){
        b=b +1
      }
      else if(star == 3){
        c=c +1
      }
      else if(star == 4){
        d=d +1
      }
      else if(star == 5){
        e=e +1
      }
      
      wordRating <-c(a,b,c,d,e)
     }
    else{
      wordRating <-c(a,b,c,d,e)
    }	
  }
  temp_wordList_DF$wordRating[i] <- wordRating
}



checkList
temp <- vector()
length(temp)
length(wordList)
abc <- y
wordVector<-vector()
checkList <- vector()
temp
unlist(strsplit(abc$text[1]," "))



