#plot2

library(data.table)
library(datasets)
library(dplyr)
data<-fread("household_power_consumption.txt")
mydata<-filter(data,Date=="1/2/2007" | Date == "2/2/2007")
date<-strptime(paste(mydata$Date,mydata$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)
png("plot2.png",width=480,height=480)
plot(date, mydata$Global_active_power,type="l",ylab="Global Active Power (kilowatts)")
dev.off()
