library(data.table)

hpcdata <- fread("sed '1p;/^[12]\\/2\\/2007/!d' household_power_consumption.txt", 
                 na.strings = c("?", ""))

png(filename = "plot1.png")
hist(hpcdata$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
