powertable<-read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
powertable[,1]<-as.Date(powertable[,1], "%d/%m/%Y")
powertable<-powertable[powertable$Date>="2007-02-01" & powertable$Date<= "2007-02-02",]

png(filename="plot1.png")
hist(powertable$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()