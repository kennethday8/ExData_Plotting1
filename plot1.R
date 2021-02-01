## load data and select only entries from two desired dates
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
date1 <- as.Date("01/02/2007", "%d/%m/%Y")
date2 <- as.Date("02/02/2007", "%d/%m/%Y")
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc <- subset(epc, epc$Date == date1 | epc$Date == date2)

## change Global_active_power variable to number
epc$Global_active_power <- as.numeric(epc$Global_active_power)

## define plotting variables
xlab1 <- "Global Active Power (kilowatts)"
ylab1 <- "Frequency"
title1 <- "Global Active Power"

## plot histogram of Global_active_power variables
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(epc$Global_active_power, col = "red", xlab = xlab1, ylab = ylab1, main = title1)
dev.off()