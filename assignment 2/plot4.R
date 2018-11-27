## Plot 4

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
src_clas <- readRDS("Source_Classification_Code.rds")

# Create plot

src_clas$EI.Sector <- as.character(src_clas$EI.Sector)
src_clas$SCC<- as.character(src_clas$SCC)

coal_comb_df <- filter(src_clas, str_detect(src_clas$EI.Sector, "Coal"))

coal_comb_vector <- coal_comb_df$SCC


coal_emiss <- NEI %>% filter(SCC %in% coal_comb_vector) %>% group_by(year) %>% summarise(total = sum(Emissions))
barplot(coal_emiss$total, names.arg = c("1999", "2002", "2005", "2008"), ylab = "Emissions PM2.5 (tons)", 
        xlab = "Year", col = "blue", main = "USA Total Emissions (PM 2.5) Coal-Combustion Related Sources")

# Save plot to png file

png("Plot4.png")
dev.set(2)
dev.copy(png, "C:/Users/ldewit/Documents/coursera_local/Exploratory_Data_Analysis/assignment 2/Plot4.png")
dev.off()
