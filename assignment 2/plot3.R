## Plot 3

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

plot3 <- NEI %>% filter(fips == 24510) %>% group_by(year, type) %>% summarise(total = sum(Emissions))

plot3$year <- as.factor(plot3$year)

ggplot(plot3, aes(x = year, y = total)) + geom_bar(stat = "identity", fill = "blue") + 
  facet_grid(.~type) + 
  ggtitle("Baltimore Emissions (PM2.5)") +
  labs(x = "Year", y = "Total Emissions (PM2.5) tons") +
  ggtitle("Emissions (PM2.5) Baltimore City per Type") +
  theme(plot.title = element_text(hjust=0.5))

# Save plot to png file

png("Plot3.png")
dev.set(2)
dev.copy(png, "C:/Users/ldewit/Documents/coursera_local/Exploratory_Data_Analysis/assignment 2/Plot3.png")
dev.off()