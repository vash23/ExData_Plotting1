data = read.table("household_power_consumption.txt", header = TRUE, sep=";", 
                  col.names=c("Date","Time","Global_active_power",
                              "Global_reactive_power","Voltage",
                              "Global_intensity","Sub_metering_1",
                              "Sub_metering_2","Sub_metering_3"), 
                  na.strings = "?")
data = as.data.frame(data)

data$DateTime = strptime(paste(data$Date, data$Time, sep=" "), 
                         format="%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date, format = "%d/%m/%Y")
##data$Time = format(data$Time, "%H:%M:%S")
data$Global_active_power = as.numeric(data$Global_active_power)
data$Global_reactive_power = as.numeric(data$Global_reactive_power)
data$Voltage = as.numeric(data$Voltage)
data$Global_intensity = as.numeric(data$Global_intensity)
data$Sub_metering_1 = as.numeric(data$Sub_metering_1)
data$Sub_metering_2 = as.numeric(data$Sub_metering_2)
data$Sub_metering_3 = as.numeric(data$Sub_metering_3)
data_sub = subset(data, data$Date>="2007-02-01" & data$Date<="2007-02-02")
rm(data)
png(file = "plot3.png")
plot(data_sub$DateTime, data_sub$Sub_metering_1, 
     ylab = "Energy sub metering", xlab= "", type ="n")
lines(data_sub$DateTime, data_sub$Sub_metering_1, col="black")
lines(data_sub$DateTime, data_sub$Sub_metering_2, col="red")
lines(data_sub$DateTime, data_sub$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), 
       lwd=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
