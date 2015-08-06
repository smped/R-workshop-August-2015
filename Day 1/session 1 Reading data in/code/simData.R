## get packages ----
library(randomNames)
library(dplyr)

## simulate data ----
set.seed(2015)

## gender ----
genders <- c("female", "male")
df <- data.frame(gender=rep(genders,each=16))

## names ----
df$name <- randomNames(gender=df$gender,ethnicity = 'white',which.names = 'first')

## weight ----
df$weight <- c(rnorm(16,65,5),rnorm(16,80,7))

## height ----
df = df %>% mutate(height = 123.7055 + 1*(gender=="Male") + (0.6617 + 0.1*(gender=="Male"))*weight + rnorm(32))

## transport ----
transport <- c("car","bike")
df$transport = c(sample(transport,16,replace = TRUE,prob = c(1/3,2/3)),
                 sample(transport,16,replace = TRUE,prob = c(2/3,1/3)))

## save data ----
write.csv(df, "Day 1/session 1 Reading data in/data/simulated_sample.csv")
