
library(data.table)
a <- fread("household_power_consumption.txt", na.strings = "?")
a[,DateTime := as.POSIXct(paste(Date,Time),format="%d/%m/%Y %H:%M:%S")]

library(dplyr)
data <- filter(a, DateTime >= as.POSIXct("2007-02-01 00:00:00"), DateTime <= as.POSIXct("2007-02-03 00:00:00"))

with(data,plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering"))
with(data,lines(DateTime,Sub_metering_2,col="red"))
with(data,lines(DateTime,Sub_metering_3,col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="plot3.png", width=480, height=480, unit="px")
dev.off()
