# this function plots the third graphic of the Assignment #1: Exploratory Data Analysis Coursera

# power consumption data file
# the file with the data needs to be on the same directory as the plot3.R file
powerConsData <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

# subsets for February 1st and 2nd
subset3 <- powerConsData[which(powerConsData[,1]=="1/2/2007" | powerConsData[,1]=="2/2/2007"),]

# Date and Time
subset3$DateTime <- paste(subset3$Date,subset3$Time)
subset3$DateTime <- strptime(subset3$DateTime,"%d/%m/%Y %H:%M:%S")

# creates the file with the plot
png("plot3.png", width=480, height=480)
# plot
x <- subset3$DateTime
y <- as.numeric(as.character(subset3[,7]))
plot(x, y, type="l", xlab="", ylab="Energy sub metering")
y <- as.numeric(as.character(subset3[,8]))
lines(x, y, col="red")
y <- as.numeric(as.character(subset3[,9]))
lines(x, y, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), col = c("black", "red", "blue"),lty=1, )
dev.off()