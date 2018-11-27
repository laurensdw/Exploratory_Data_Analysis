## Plot 6

# Load packages
library(dplyr)
library(ggplot2)
library(stringr)

#Download and Unzip files
setwd("~/coursera_local/Data")
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", temp)
unzip(temp, c("summarysrc_clas_PM25.rds", "Source_Classification_Code.rds"))
NEI <- readRDS("summarysrc_clas_PM25.rds")

# Create plot

plot6 <- NEI %>% filter(fips %in% c("24510", "06037"), type == "ON-ROAD") %>% 
  group_by(year, fips) %>% summarise(total = sum(Emissions))

Location <- str_replace_all(plot6$fips, c("06037" = "LA County", "24510" = "Baltimore City")) 

plot6$year <- as.factor(plot6$year)

ggplot(plot6, aes(x = year, y = total)) + 
  geom_bar(stat = "identity", position = "dodge", aes(fill = Location)) + 
  labs(x = "Year", y = "Total Emissions (PM2.5) tons") + 
  ggtitle("On Road Emissions (PM2.5) Baltimore City & LA County") + 
  theme(plot.title = element_text(hjust=0.5))

png("Plot6.png")
dev.set(2)
dev.copy(png, "C:/Users/ldewit/Documents/coursera_local/Exploratory_Data_Analysis/assignment 2/Plot6.png")
dev.off()