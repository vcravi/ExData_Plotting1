library(data.table)

hpcdata <- fread("sed '1p;/^[12]\\/2\\/2007/!d' household_power_consumption.txt", 
                 na.strings = c("?", ""))
SampleTime <- paste(hpcdata$Date, hpcdata$Time)
SampleTime <- strptime(SampleTime, format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png")
plot(SampleTime, hpcdata$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab= "")
dev.off()
