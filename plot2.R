## load data and select only entries from two desired dates
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
date1 <- as.Date("01/02/2007", "%d/%m/%Y")
date2 <- as.Date("02/02/2007", "%d/%m/%Y")
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc <- subset(epc, epc$Date == date1 | epc$Date == date2)

## combine date and time columns to create datetime variable
epc$DateTime <- as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S")

## define plotting variables
ylab2 <- "Global Active Power (kilowatts)"

## plot line graph of DateTime vs. Global_active_power
png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(epc$DateTime, epc$Global_active_power, type = "l", xlab = "", ylab = ylab2)
dev.off()