# Jan 6, 2015
# Joe DiGennaro
# Project 1 Plot 3 - Exploratory Data Analysis

setwd('C:\\Users\\digenjoe\\Documents\\Cousera\\Exploratory Data Analysis')

# Read in data
power <- read.table("./household_power_consumption.txt", sep=";", 
                    header=TRUE, 
                    colClasses=c("character","character",rep("numeric",7)),
                    na.strings="?")

# Subset out the 2 dates
powerUse <- power[as.Date(power$Date, "%d/%m/%Y") >= "2007-02-01" &
                          as.Date(power$Date, "%d/%m/%Y") <= "2007-02-02",]

# Format date and time variables
dt <- paste(powerUse$Date, powerUse$Time)
datetime <- strptime(dt, "%d/%m/%Y %H:%M:%S")

#Plot data to file
png(file="plot3.png", width = 480, height = 480)

plot(datetime, powerUse$Sub_metering_1, type="l", 
     col="black", xlab="", ylab="Energy sub metering")
points(datetime, powerUse$Sub_metering_2, type="l", col="red")
points(datetime, powerUse$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
