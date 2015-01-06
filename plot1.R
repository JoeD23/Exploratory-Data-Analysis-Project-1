# Jan 6, 2015
# Joe DiGennaro
# Project 1 Plot 1 - Exploratory Data Analysis
setwd('C:\\Users\\digenjoe\\Documents\\Cousera\\Exploratory Data Analysis')

# Read in data
power <- read.table("./household_power_consumption.txt", sep=";", 
                    header=TRUE, 
                    colClasses=c("character","character",rep("numeric",7)),
                    na.strings="?")

# Subset out the 2 dates
powerUse <- power[as.Date(power$Date, "%d/%m/%Y") >= "2007-02-01" &
                  as.Date(power$Date, "%d/%m/%Y") <= "2007-02-02",]


# Plot 1- Fequency of Global Active Power

png(file="plot1.png", width = 480, height = 480)

hist(powerUse$Global_active_power, col="red", 
          xlab="Global Active Power (kilowatts)", 
          main="Global Active Power")
dev.off()

