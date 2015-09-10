##############################################################################
########## Course Project 1. Exploratory Data Analysis #######################
##############################################################################

## The first step is to load the data into R

data<- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na = "?")

# Filter the dates

data_filter<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Create the variable DateTime with the Date/Time in appropriate format

data_filter$DateTime <- strptime(paste(data_filter$Date, data_filter$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
attach(data_filter)

# Creation of the plots

png(filename = "plot4.png", width = 480, height = 480, bg = "transparent", type="windows")

## Divide the screen in 4 subsections
par(mfrow = c(2, 2)) 

### Plot 1
plot(DateTime, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power")

### Plot 2
plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

### Plot 3
plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(DateTime, Sub_metering_2, col = "red")
lines(DateTime, Sub_metering_3, col = "blue")
legend("topright", bty = "n", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd = 1)

### Plot 4
plot(DateTime, Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = colnames(data_filter)[4])
dev.off()