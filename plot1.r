#plot1

library(data.table)
library(datasets)
library(dplyr)
data<-fread("household_power_consumption.txt")
data$Date<-as.Date(data$Date,format = "%d/%m/%Y")
mydata<-filter(data,Date=="1/2/2007" | Date == "2/2/2007")
mydata$Global_active_power<-as.numeric(mydata$Global_active_power)

png(filename='plot1.png', width=480, height=480, units='px')
hist(mydata$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()