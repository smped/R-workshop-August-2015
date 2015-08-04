## ---- get packages
library(randomNames)
library(grid)
library(dplyr)
library(ggplot2)
## ---- get stick figure function
source("code/stickFig.R")
## ---- simulate data
set.seed(2014)
# gender
genders <- c("female", "male")
df = data.frame(gender=rep(genders,each=16))
# names
df$name = randomNames(gender=df$gender,ethnicity = 'white',which.names = 'first')
# weight
df$weight = c(rnorm(16,65,5),rnorm(16,80,7))
# height
df = df %.% mutate(height = 123.7055 + 1*(gender=="Male") + (0.6617 + 0.1*(gender=="Male"))*weight + rnorm(32))
# transport
transport = c("car","bike")
df$transport = c(sample(transport,16,replace = TRUE,prob = c(1/3,2/3)),
                 sample(transport,16,replace = TRUE,prob = c(2/3,1/3)))
# Create labels for plot
df = df %.% mutate(text=paste(name,
                              gender,
                              paste("Weight:",round(weight,1)),
                              paste("Height:",round(height,1)),
                              transport, sep='\n'))
# arms, face, hats
df$arms = sample(c("down", "nuetral", "up", "hip", "wave"),size=32,replace=TRUE)
df$face = sample(c("happy", "sad", "annoyed", "surprised"),size=32,replace=TRUE)
df$hat = sample(c(TRUE,FALSE),size=32,replace=TRUE)
## ---- create grid of stick figures with info
pdf("fig/data.pdf",width=23,height=8.5)
plot(c(0,60), c(0,21), type="n", xaxt='n', yaxt='n', ann=FALSE,frame.plot=FALSE)
par(mar = rep(0, 4), oma=rep(0,4))
count = 1
for(i in seq(0,55,7.5)){
  for(j in seq(0,16,5.25)){
    m = 0.1
    rect(xleft=i+m,ybottom=j+m,xright=i+7.5-m,ytop=j+5.25-m)
    draw.stick(i,j,scale=4,gender=df$gender[count],
               arms=df$arms[count],face=df$face[count],hat=df$hat[count])
    text(i+7,j+5,labels=df$text[count],cex=1,adj=c(1,1))
    count = count + 1
  }
}
dev.off()
## ---- save data 
cards = df %.% select(-text)
write.csv(cards,"data/cards.csv",row.names=FALSE, quote=FALSE)
