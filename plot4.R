powertable<-read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE, stringsAsFactors=FALSE)
datetime<-strptime(paste(powertable$Date, powertable$Time), "%d/%m/%Y %H:%M:%S")
powertable<-cbind(datetime, powertable)
powertable[,2]<-as.Date(powertable[,2], "%d/%m/%Y")
powertable<-powertable[powertable$Date>="2007-02-01" & powertable$Date<= "2007-02-02",]

png(filename="plot4.png")

par(mfcol=c(2,2))

with(powertable, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

with(powertable, plot(datetime, Sub_metering_1, type="n", xlab="",ylab=""))
with(powertable, lines(datetime, Sub_metering_1, col="black"))
with(powertable, lines(datetime, Sub_metering_2, col="red"))
with(powertable, lines(datetime, Sub_metering_3, col="blue"))
title(ylab="Energy sub metering")
legend("topright", bty="n", col=c("black","red","blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(powertable, plot(datetime, Voltage, type="l"))

with(powertable, plot(datetime, Global_reactive_power, type="l"))

dev.off()