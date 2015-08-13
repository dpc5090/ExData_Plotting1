Plot3<-function(){
  dat<-read.table("household_power_consumption.txt",header = TRUE, sep = ";")
  dat$Date<-strptime(dat$Date,"%d/%m/%Y")
  dat$Time<-strptime(dat$Time,"%H:%M:%S")
  shortdat<-dat[as.Date(dat$Date)<="2007-02-02" & as.Date(dat$Date)>="2007-02-01",]
  temp<-paste(shortdat$Date,strftime(shortdat$Time, "%H:%M:%S"))
  temp<-strptime(temp,"%Y-%m-%d %H:%M:%S")
  
  
  png(filename = "plot3.png",width = 480, height = 480)
  plot(temp,as.numeric(as.character(shortdat$Sub_metering_1)),type = "l", col = "black", ylim = c(0,38),ylab = "",xlab = "")
  par(new=T)
  plot(temp,as.numeric(as.character(shortdat$Sub_metering_2)),type = "l", col = "red", ylim = c(0,38),ylab = "",xlab = "")
  par(new=T)
  plot(temp,as.numeric(as.character(shortdat$Sub_metering_3)),type = "l", col = "blue", ylim = c(0,38),ylab = "Energy sub metering",xlab = "")
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col = c("black","red","blue"))
  
  dev.off()
}