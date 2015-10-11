#plot3

library(data.table)
library(datasets)
library(dplyr)
data<-fread("household_power_consumption.txt")
mydata<-filter(data,Date=="1/2/2007" | Date == "2/2/2007")
date<-strptime(paste(mydata$Date,mydata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

mydata$Global_active_power<-as.numeric(mydata$Global_active_power)

mydata$Sub_metering_1<-as.numeric(mydata$Sub_metering_1)
mydata$Sub_metering_2<-as.numeric(mydata$Sub_metering_2)
mydata$Sub_metering_3<-as.numeric(mydata$Sub_metering_3)
png("plot3.png",width=480,height=480)
plot(date,mydata$Sub_metering_1,type="l",ylab="Energy Submetering",xlab="")
lines(date,mydata$Sub_metering_2,type="l",col="red")
lines(date,mydata$Sub_metering_3,type="l",col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()


