library(sqldf)
setwd('/Users/Nan/Documents/Mooc/Exploratory data')
#read in needed data only
data<-read.csv2.sql('household_power_consumption.txt',sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007' ")
#reset time and date into Date/Time classes
data$DateTime<-paste(data$Date,data$Time)
data$DateTime <- strptime(data$DateTime , "%e/%m/%Y %H:%M:%S")
#plot
png(file='plot4.png', width=480, height=480)
par(mfrow=c(2,2))
plot(data$DateTime,data$Global_active_power,type="l",ylab='Global Active Power(kilowatts)',xlab='')
plot(data$DateTime,data$Voltage,type="l",ylab='Voltage',xlab='datetime')
plot(data$DateTime,data$Sub_metering_1,type='l',ylab='Energy sub metering',xlab='',col='black')
lines(data$DateTime,data$Sub_metering_2,col='red')
lines(data$DateTime,data$Sub_metering_3,col='blue')
legend('topright',lty=1,bty='n',col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
plot(data$DateTime,data$Global_reactive_power,type="l",ylab='Global_reactive_power',xlab='datetime')
dev.off()
