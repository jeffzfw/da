fname <-"household_power_consumption.txt"
df<-read.table(fname,na.strings = "?",header = T,sep = ";")
dd<-subset(x = df,df$Date=="1/2/2007"|df$Date=="2/2/2007")
time<-strptime(paste(dd$Date,dd$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
dd$ddTime<-time
with(dd, {
  plot(x=ddTime, y=Sub_metering_1 , type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(x = ddTime,y = Sub_metering_2 ,  col = 'Red')
  lines(x = ddTime,y = Sub_metering_3 , col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex =0.5,x.intersp = 1, y.intersp = 1)
dev.copy(png,file = "plot3.png")
dev.off()

