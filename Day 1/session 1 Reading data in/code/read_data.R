## Reading data in via menu ----


## Reading in using read.csv() ----
fvc <- read.csv("Day 1/session 1 Reading data in/data/fvc.csv")
head(fvc)

## Reading in using read_csv() ----
library(readr)
fvc <- read_csv("Day 1/session 1 Reading data in/data/fvc.csv")
head(fvc)

## What is the difference? ----
sample1 <- read.csv("Day 1/session 1 Reading data in/data/simulated_sample.csv")
sample2 <- read_csv("Day 1/session 1 Reading data in/data/simulated_sample.csv")
sample1
class(sample1$name)
sample2
class(sample2$name)

## Using read_excel() ----
library(readxl)
fvc <- read_excel("Day 1/session 1 Reading data in/data/fvc.xlsx")
head(fvc)

## Dealing with headers ----
no_header <- read.csv("Day 1/session 1 Reading data in/data/no_header.csv")
head(no_header)
no_header <- read.csv("Day 1/session 1 Reading data in/data/no_header.csv", header = FALSE)
head(no_header)
no_header <- read_csv("Day 1/session 1 Reading data in/data/no_header.csv")
no_header
no_header <- read_csv("Day 1/session 1 Reading data in/data/no_header.csv", col_names = FALSE)
no_header
no_header <- read_csv("Day 1/session 1 Reading data in/data/no_header.csv", 
                      col_names = c("ID","gender", "name", "weight", "height", "transport"))
no_header
no_header <- read_excel("Day 1/session 1 Reading data in/data/no_header.xlsx", col_names = FALSE)
no_header

## Dealing with comments ----
comments <- read.csv("Day 1/session 1 Reading data in/data/comments.csv")
comments <- read.csv("Day 1/session 1 Reading data in/data/comments.csv", skip = 1)
head(comments)
comments <- read.csv("Day 1/session 1 Reading data in/data/comments.csv", comment.char = "#")
head(comments)
comments <- read_csv("Day 1/session 1 Reading data in/data/comments.csv", skip = 1)
comments

## Missing values ----
missing <- read_excel("Day 1/session 1 Reading data in/data/missing_data.xlsx")
missing
missing <- read_excel("Day 1/session 1 Reading data in/data/missing_data2.xlsx")
missing
class(missing$weight)
missing <- read_excel("Day 1/session 1 Reading data in/data/missing_data2.xlsx", na = "-")
missing
class(missing$weight)
