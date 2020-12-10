#the table is read, the names for the columns is assign, and the 2-days of 2007 are subset.
poder <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(poder) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpoder <- subset(poder,poder$Date=="1/2/2007"|poder$Date=="2/2/2007")


#plot 1 just a histogram of global_active_power.
hist(as.numeric(subpoder$Global_active_power),col="red",main="Global Active Power",xlab = "Global Active Power(kilowatts)")

#creation of the .png image of the plot.
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()





