#read data 
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)
#for performance purpose, using Date as string to get a smaller subset for 2 first day of Feb 2007
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")
#making plot for 3 kind of Energy sub metering in the 2 days
png("plot3.png")
#make plot of first sub metering
plot(data$DateTime, data$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")

#add sub metering 2 &  3
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
#add legend for 3 types
legend("topright", pch = "----", col = c("black","blue", "red"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
dev.off()

