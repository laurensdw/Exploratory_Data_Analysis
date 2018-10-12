library(dplyr)
library(lubridate)

setwd("C:/Users/ldewit/Documents/coursera_local/Exploratory_Data_Analysis_Coursera/assignment 1")

## Loading data
df <- read.csv("../../Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Manipulating and subsetting data
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df <- filter(df, Date == as.Date('2007-02-01') | Date == as.Date('2007-02-02'))
datetime <- paste(as.Date(df$Date), df$Time)
df$Datetime <- as.POSIXct(datetime)

## Plot2
plot(df$Global_active_power~df$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file
dev.copy(png, file="plot2.png", height=500, width=500)
dev.off()