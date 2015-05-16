fname <-"household_power_consumption.txt"
df<-read.table(fname,na.strings = "?",header = T,sep = ";")
dd<-subset(x = df,df$Date=="1/2/2007"|df$Date=="2/2/2007")
time<-strptime(paste(dd$Date,dd$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
dd$ddTime<-time
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(dd, {
  plot(x =ddTime,y=Global_active_power , type = "l", ylab = "Global Active Power", xlab = "")
  plot(x= ddTime,y=Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(x=ddTime,y=Sub_metering_1, type = "l", ylab = "Energy sub metering",xlab = "")
       lines(x=ddTime,y=Sub_metering_2, col = 'Red')
       lines(x=ddTime,y=Sub_metering_3, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n",cex = 0.3,
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(x=ddTime,y=Global_reactive_power, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})
dev.copy(png,file = "plot4.png")
dev.off()

