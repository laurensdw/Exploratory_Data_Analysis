library(dplyr)

setwd("C:/Users/ldewit/Documents/coursera_local/Exploratory_Data_Analysis_Coursera/assignment 1")

## Loading data
df <- read.csv("../../Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Manipulating and subsetting data
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df <- filter(df, Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))

## Plot2