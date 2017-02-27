
library(data.table)
a <- fread("household_power_consumption.txt", na.strings = "?")
a[,DateTime := as.POSIXct(paste(Date,Time),format="%d/%m/%Y %H:%M:%S")]

library(dplyr)
data <- filter(a, DateTime >= as.POSIXct("2007-02-01 00:00:00"), DateTime <= as.POSIXct("2007-02-03 00:00:00"))

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(2,2,2,2))
with(data,{
plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power") 
plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage") 
plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
lines(DateTime,Sub_metering_2,col="red")
lines(DateTime,Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(DateTime,Global_reactive_power,type="l",xlab="",ylab="Global_rective_power") 
})

dev.copy(png, file="plot4.png", width=480, height=480, unit="px")
dev.off()

