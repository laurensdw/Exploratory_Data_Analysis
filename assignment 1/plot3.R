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

## Plot 3
with(df, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=500, width=500)
dev.off()