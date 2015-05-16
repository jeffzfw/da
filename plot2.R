fname <-"household_power_consumption.txt"
df<-read.table(fname,na.strings = "?",header = T,sep = ";")
dd<-subset(x = df,df$Date=="1/2/2007"|df$Date=="2/2/2007")
time<-strptime(paste(dd$Date,dd$Time, sep = " "),"%d/%m/%Y %H:%M:%S")
dd$ddTime<-time
plot(x = dd$ddTime,y = dd$Global_active_power,type = "s",ylab = "Global Active Power(Kilowatts)",xlab =" " )

dev.copy(png,file = "plot2.png")
dev.off()
