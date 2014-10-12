# this function plots the fourth graphic of the Assignment #1: Exploratory Data Analysis Coursera

# power consumption data file
# the file with the data needs to be on the same directory as the plot4.R file 
powerConsData <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

# subsets for February 1st and 2nd
subset4 <- powerConsData[which(powerConsData[,1]=="1/2/2007" | powerConsData[,1]=="2/2/2007"),]

# Date and Time
subset4$DateTime <- paste(subset4$Date,subset4$Time)
subset4$DateTime <- strptime(subset4$DateTime,"%d/%m/%Y %H:%M:%S")

# creates the file with the plot
png("plot4.png", width=480, height=480)
# plot
par(mfcol=c(2,2))

# first plots the global active power
plot(subset4$DateTime, as.numeric(as.character(subset4[,3])), type="l", xlab="", ylab= "Global Active Power")

# second plots the sub meterings
plot(subset4$DateTime, as.numeric(as.character(subset4[,7])), type="l", xlab="", ylab="Energy sub metering")
lines(subset4$DateTime, as.numeric(as.character(subset4[,8])), col="red")
lines(subset4$DateTime, as.numeric(as.character(subset4[,9])), col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), col = c("black", "red", "blue"),lty=1, )

# third plots the voltage
plot(subset4$DateTime, as.numeric(as.character(subset4[,5])), type="l", xlab="datetime", ylab= "Voltage")

# fourth plots the global reactive power
plot(subset4$DateTime, as.numeric(as.character(subset4[,4])), type="l", xlab="datetime", ylab= "Global Reactive Power")

dev.off()