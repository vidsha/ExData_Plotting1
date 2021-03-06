library(data.table)
a <- fread("household_power_consumption.txt", na.strings = "?")
a[,DateTime := as.POSIXct(paste(Date,Time),format="%d/%m/%Y %H:%M:%S")]

library(dplyr)
data <- filter(a, DateTime >= as.POSIXct("2007-02-01 00:00:00"), DateTime <= as.POSIXct("2007-02-03 00:00:00"))

with(data,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.copy(png, file="plot1.png", width=480, height=480, unit="px")
dev.off()
