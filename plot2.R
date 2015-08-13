Plot2<-function(){
  dat<-read.table("household_power_consumption.txt",header = TRUE, sep = ";")
  dat$Date<-strptime(dat$Date,"%d/%m/%Y")
  dat$Time<-strptime(dat$Time,"%H:%M:%S")
  shortdat<-dat[as.Date(dat$Date)<="2007-02-02" & as.Date(dat$Date)>="2007-02-01",]
  temp<-paste(shortdat$Date,strftime(shortdat$Time, "%H:%M:%S"))
  temp<-strptime(temp,"%Y-%m-%d %H:%M:%S")
  
  
  png(filename = "plot2.png",width = 480, height = 480)
  
  plot(temp,as.numeric(as.character(shortdat$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
  
  dev.off()
}