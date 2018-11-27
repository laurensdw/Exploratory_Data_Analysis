## Plot 1

# Load packages
library(dplyr)
library(ggplot2)

#Download and Unzip files
setwd("~/coursera_local/Data")
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", temp)
unzip(temp, c("summarySCC_PM25.rds", "Source_Classification_Code.rds"))
NEI <- readRDS("summarySCC_PM25.rds")
src_clas <- readRDS("Source_Classification_Code.rds")

# Create plot
ann_emissions <- group_by(NEI, year) %>% summarise(total = sum(Emissions))
barplot(ann_emissions$total, names.arg = c("1999", "2002", "2005", "2008"), 
        ylab = "Emissions PM2.5 (tons)", xlab = "Year", 
        col = "red", main = "Total Emissions (PM 2.5) - All Sources")

png("Plot1.png")
dev.set(2)
dev.copy(png, "C:/Users/ldewit/Documents/coursera_local/Exploratory_Data_Analysis/assignment 2/Plot1.png")
dev.off()