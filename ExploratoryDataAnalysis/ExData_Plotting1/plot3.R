## Load the data
setwd('Coursera/ExploratoryDataAnalysis/ExData_Plotting1')
hpc <- read.table('household_power_consumption.txt', sep=';', stringsAsFactors = F, header = T)

## Filter the data
hpc <- hpc[(hpc$Date=="1/2/2007")|(hpc$Date=="2/2/2007"),]
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc <- na.omit(hpc)

## Make Plots
# plot3.png
png(filename="plot3.png")
plot(hpc$DateTime, hpc$Sub_metering_1,type="l",  xlab="",ylab="Energy sub metering",col='black')
points(hpc$DateTime, hpc$Sub_metering_2,type="l",col='red')
points(hpc$DateTime, hpc$Sub_metering_3,type="l",col='blue')
legend("topright", lwd=1, col=c('black','red','blue'),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()