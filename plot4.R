## load data and select only entries from two desired dates
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
date1 <- as.Date("01/02/2007", "%d/%m/%Y")
date2 <- as.Date("02/02/2007", "%d/%m/%Y")
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
epc <- subset(epc, epc$Date == date1 | epc$Date == date2)

## combine date and time columns to create datetime variable
epc$DateTime <- as.POSIXct(paste(epc$Date, epc$Time), format="%Y-%m-%d %H:%M:%S")

## change Voltage and Global_reactive_power variables to numbers
epc$Voltage <- as.numeric(epc$Voltage)
epc$Global_reactive_power <- as.numeric(epc$Global_reactive_power)

## define plotting variables
ylab4_1 <- "Global Active Power"
ylab4_2 <- "Energy sub metering"
legend4_2 <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
col4_2 <- c("black", "red", "blue")
xlab4_3 <- "datetime"
ylab4_3 <- "Voltage"
xlab4_4 <- "datetime"
ylab4_4 <- "Global_reactive_power"

## create multi-graph plot
png(file = "plot4.png", width = 480, height = 480, units = "px")

## top-left: DateTime vs. Global-active_power
plot(epc$DateTime, epc$Global_active_power, type = "l", xlab = "", ylab = ylab4_1)

## bottom-left: DateTime vs. Sub_meterings 1, 2, and 3
plot(epc$DateTime, epc$Sub_metering_1, type = "l", xlab = "", ylab = ylab4_2)
points(epc$DateTime, epc$Sub_metering_2, col = "red", type = "l")
points(epc$DateTime, epc$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, legend = legend4_2, col = col4_2, bty = "n")

## top-right: DateTime vs. Voltage
plot(epc$DateTime, epc$Voltage, type = "l", xlab = xlab4_3, ylab = ylab4_3)

## bottom-right: DateTime vs. Global_reactive_power
plot(epc$DateTime, epc$Global_reactive_power, type = "l", xlab = xlab4_4, ylab = ylab4_4)

dev.off()