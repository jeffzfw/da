setwd("c:/coursera/4")
fname <-"household_power_consumption.txt"
df<-read.table(fname,na.strings = "?",header = T,sep = ";")
dd<-subset(x = df,df$Date=="1/2/2007"|df$Date=="2/2/2007")
hist(dd$Global_active_power,xlab = "Global Active Power(kilowattes)",main = "Gloabl Active Power",col = "red")


dev.copy(png,file = "plot1.png")

dev.off()

