library(sqldf)
setwd('/Users/Nan/Documents/Mooc/Exploratory data')
#read in needed data only
data<-read.csv2.sql('household_power_consumption.txt',sql = "select * from file where Date = '2/2/2007' or Date = '1/2/2007' ")
#reset time and date into Date/Time classes
data$DateTime<-paste(data$Date,data$Time)
data$DateTime <- strptime(data$DateTime , "%e/%m/%Y %H:%M:%S")
#line plot see "https://stat.ethz.ch/R-manual/R-devel/library/graphics/html/plot.html"
png(file='plot2.png', width=480, height=480)
plot(data$DateTime,data$Global_active_power,type="l",ylab='Global Active Power(kilowatts)',xlab='')
dev.off()