# this function plots the second graphic of the Assignment #1: Exploratory Data Analysis Coursera

# power consumption data file
# the file with the data needs to be on the same directory as the plot2.R file
powerConsData <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

# subsets for February 1st and 2nd
subset2 <- powerConsData[which(powerConsData[,1]=="1/2/2007" | powerConsData[,1]=="2/2/2007"),]

# Date and Time
subset2$DateTime <- paste(subset2$Date,subset2$Time)
subset2$DateTime <- strptime(subset2$DateTime,"%d/%m/%Y %H:%M:%S")

# creates the file with the plot
png("plot2.png", width=480, height=480)
# plot
x <- subset2$DateTime
y <- as.numeric(as.character(subset2[,3]))
plot(x,y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
