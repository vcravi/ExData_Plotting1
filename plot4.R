library(data.table)

hpcdata <- fread("sed '1p;/^[12]\\/2\\/2007/!d' household_power_consumption.txt", 
                 na.strings = c("?", ""))

SampleTime <- paste(hpcdata$Date, hpcdata$Time)
SampleTime <- strptime(SampleTime, format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png")
par(mfrow = c(2,2))
plot(SampleTime, hpcdata$Global_active_power, type="l", 
     ylab="Global Active Power", xlab= "")
plot(SampleTime, hpcdata$Voltage, type="l", 
     ylab="Voltage", xlab= "datetime")
plot(SampleTime, hpcdata$Sub_metering_1, type="l", 
     ylab="Energy sub metering", xlab= "")
lines(SampleTime, hpcdata$Sub_metering_2, col = "red")
lines(SampleTime, hpcdata$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lwd = 2, bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(SampleTime, hpcdata$Global_reactive_power, type="l", 
     ylab="Global_reactive_power", xlab= "datetime")
dev.off()


