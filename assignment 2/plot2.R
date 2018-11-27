## Plot 2

# Load packages
library(dplyr)
library(ggplot2)

#Download and Unzip files
setwd("~/coursera_local/Data")
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", temp)
unzip(temp, c("summarySCC_PM25.rds", "Source_Classification_Code.rds"))
NEI <- readRDS("summarySCC_PM25.rds")

# Create plot

balt_emiss <- NEI %>% filter(fips == 24510) %>% group_by(year) %>% summarise(total = sum(Emissions))
barplot(balt_emiss$total, names.arg = c("1999", "2002", "2005", "2008"), 
        xlab = "Year", ylab = "Emissions PM2.5 (tons)", main = "Baltimore Annual Emissions (PM 2.5)", 
        col = "green", ylim = c(0, 3800))

# Save plot to png file

png("Plot2.png")
dev.set(2)
dev.copy(png, dev.copy(png, "C:/Users/ldewit/Documents/coursera_local/Exploratory_Data_Analysis/assignment 2/Plot2.png"))
dev.off()