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

## Creation of the plot

png(filename = "plot1.png", width = 480, height = 480, bg = "transparent", type="windows")

hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200))

dev.off()