
library(data.table)
a <- fread("household_power_consumption.txt", na.strings = "?")
a[,DateTime := as.POSIXct(paste(Date,Time),format="%d/%m/%Y %H:%M:%S")]

library(dplyr)
data <- filter(a, DateTime >= as.POSIXct("2007-02-01 00:00:00"), DateTime <= as.POSIXct("2007-02-03 00:00:00"))

with(data,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot2.png", width=480, height=480, unit="px")
dev.off()
