#read data 
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")


#take subset for 2 first day of Feb 2007
data <- data[data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02"), ]
png("plot1.png")
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)" , col = "red")
dev.off()