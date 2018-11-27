## Plot 5

# Load packages
library(dplyr)

#Download and Unzip files
setwd("~/coursera_local/Data")
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", temp)
unzip(temp, c("summarySCC_PM25.rds", "Source_Classification_Code.rds"))
NEI <- readRDS("summarySCC_PM25.rds")
src_clas <- readRDS("Source_Classification_Code.rds")

# Create plot

motor_emissions <- NEI %>% filter(type == "ON-ROAD") %>% group_by(year) %>% summarise(total = sum(Emissions))
barplot(motor_emissions$total, names.arg = c("1999", "2002", "2005", "2008"), 
        xlab = "Year", ylab = "Emissions PM2.5 (tons)", 
        main = "Total Motor Vehicle Related Emissions (PM2.5) - Baltimore City", col = "purple")

# Save plot to png file

png("Plot5.png")
dev.set(2)
dev.copy(png, "C:/Users/ldewit/Documents/coursera_local/Exploratory_Data_Analysis/assignment 2/Plot5.png")
dev.off()