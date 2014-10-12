# this function plots the first graphic of the Assignment #1: Exploratory Data Analysis Coursera

# power consumption data file
# the file with the data needs to be on the same directory as the plot1.R file
powerConsData <- read.csv("household_power_consumption.txt", header=TRUE, sep=";")

# subsets for February 1st and 2nd
subset1 <- powerConsData[which(powerConsData[,1]=="1/2/2007" | powerConsData[,1]=="2/2/2007"),]

# creates the file with the histogram
png("plot1.png", width=480, height=480)
# histogram
hist(as.numeric(as.character(subset1[,3])),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
