#read data 
data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)
#for performance purpose, using Date as string to get a smaller subset for 2 first day of Feb 2007
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

#making plot of Global Active Power in the 2 days
png("plot2.png")
plot(data$DateTime, data$Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "", type = "n")
lines(data$DateTime, data$Global_active_power)
dev.off()

