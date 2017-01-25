powertable<-read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE, stringsAsFactors=FALSE)
datetime<-strptime(paste(powertable$Date, powertable$Time), "%d/%m/%Y %H:%M:%S")
powertable<-cbind(datetime, powertable)
powertable[,2]<-as.Date(powertable[,2], "%d/%m/%Y")
powertable<-powertable[powertable$Date>="2007-02-01" & powertable$Date<= "2007-02-02",]

png(filename="plot2.png")
with(powertable, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()