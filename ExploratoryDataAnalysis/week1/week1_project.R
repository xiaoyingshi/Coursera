## Load the data
setwd('')
hpc <- read.table('household_power_consumption.txt', sep=';', stringsAsFactors = F, header = T)

## Filter the data
hpc <- hpc[(hpc$Date=="1/2/2007")|(hpc$Date=="2/2/2007"),]
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc <- na.omit(hpc)

## Make Plots
# plot1.png
png('plot1.png')
hist(hpc$Global_active_power, col='red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power', xlim = c(0,6))
dev.off()


# plot2.png
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, format="%d/%m/%Y %H:%M:%S")
png(filename="plot2.png")
plot(hpc$DateTime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


# plot3.png
png(filename="plot3.png")
plot(hpc$DateTime, hpc$Sub_metering_1,type="l", ylab="Energy sub metering",col='black')
points(hpc$DateTime, hpc$Sub_metering_2,type="l",col='red')
points(hpc$DateTime, hpc$Sub_metering_3,type="l",col='blue')
legend("topright", lwd=1, col=c('black','red','blue'),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()



# plot4.png
png(filename="plot4.png")
par(mfrow=c(2,2))
plot(hpc$DateTime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(hpc$DateTime, hpc$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(hpc$DateTime, hpc$Sub_metering_1,type="l",  xlab="",ylab="Energy sub metering",col='black')
points(hpc$DateTime, hpc$Sub_metering_2,type="l",col='red')
points(hpc$DateTime, hpc$Sub_metering_3,type="l",col='blue')
legend("topright", lwd=1, col=c('black','red','blue'),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(hpc$DateTime, hpc$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()


