#plot4

library(data.table)
library(datasets)
library(dplyr)
data<-fread("household_power_consumption.txt")
mydata<-filter(data,Date=="1/2/2007" | Date == "2/2/2007")
date<-strptime(paste(mydata$Date,mydata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
plot(date, mydata$Global_active_power,type="l",xlab=" ",ylab="Global Active Power (kilowatts)")

mydata$Voltage<-as.numeric(mydata$Voltage)
plot(date,mydata$Voltage,type="l",xlab="datetime",ylab="Voltage")

mydata$Sub_metering_1<-as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2<-as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3<-as.numeric(mydata$Sub_metering_3)
plot(date,mydata$Sub_metering_1,type="l",xlab=" ",ylab="Energy Submetering")
lines(date,mydata$Sub_metering_2,type="l",col="red")
lines(date,mydata$Sub_metering_3,type="l",col="blue")



mydata$Global_reactive_power<-as.numeric(mydata$Global_reactive_power)
plot(date,mydata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

dev.off()


