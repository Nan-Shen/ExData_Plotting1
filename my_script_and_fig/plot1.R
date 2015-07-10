library(sqldf)
setwd('/Users/Nan/Documents/Mooc/Exploratory data')
#read in needed data only
data<-read.csv2.sql('household_power_consumption.txt',sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007' ")
#reset time and date into Date/Time classes
data$DateTime<-paste(data$Date,data$Time)
data$DateTime <- strptime(data$DateTime , "%e/%m/%Y %H:%M:%S")
png(file='plot1.png', width=480, height=480)
hist(data$Global_active_power,col='red',xlab='Global Active Power(kilowatts)',main='Global Active Power')
dev.off()