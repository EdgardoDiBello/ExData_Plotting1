#the table is read, the names for the columns is assign, and the 2-days of 2007 are subset.
poder <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(poder) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpoder <- subset(poder,poder$Date=="1/2/2007"|poder$Date=="2/2/2007")

#date and time column formatted form a character to a Date/Time format of R.
subpoder$Date <- as.Date(subpoder$Date, format="%d/%m/%Y")
subpoder$Time <- strptime(subpoder$Time,format="%H:%M:%S")
subpoder[1:1440,"Time"] <- format(subpoder[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpoder[1441:2880,"Time"] <- format(subpoder[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#plot 4 first the we set the graphical parameter to 2,2 in that way we can plot 4 graph in the same space.
#3 graph 1 and 3 are the same ones of the other plots, the 2nd is a voltage vs time, and the 4th one is global reactive power vs time
par(mfrow=c(2,2))
with(subpoder,{
  plot(Time,as.numeric(Global_active_power),type="l",xlab="",ylab="Global Active Power",main="Global Active Power vs Time")
  plot(Time,as.numeric(Voltage),type="l",xlab="Datetime",ylab="Voltage",main="Voltage vs Time")
  plot(Time, Sub_metering_1,type="n",xlab="",ylab="Energy sub metering",main="Energy sub metering vs Time")
  with(subpoder,lines(Time,as.numeric(Sub_metering_1)))
  with(subpoder,lines(Time,as.numeric(Sub_metering_2),col="red"))
  with(subpoder,lines(Time,as.numeric(Sub_metering_3),col="blue"))
  legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.6,bty="n")
  plot(Time,as.numeric(Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power",main="Global Reactive Power vs Time")
})

#creation of the .png image of the plot.
dev.copy(png,file="plot4.png")
dev.off()
