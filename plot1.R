Plot1<-function(){
  dat<-read.table("household_power_consumption.txt",header = TRUE, sep = ";")
  dat$Date<-strptime(dat$Date,"%d/%m/%Y")
  shortdat<-dat[as.Date(dat$Date)<="2007-02-02" & as.Date(dat$Date)>="2007-02-01",]
  png(filename = "plot1.png",width = 480, height = 480)
  hist(as.numeric(as.character(shortdat$Global_active_power)), col = "red", xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
  dev.off()
}