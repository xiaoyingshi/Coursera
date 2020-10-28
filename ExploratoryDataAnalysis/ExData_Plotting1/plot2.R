## Load the data
setwd('Coursera/ExploratoryDataAnalysis/ExData_Plotting1')
hpc <- read.table('household_power_consumption.txt', sep=';', stringsAsFactors = F, header = T)

## Filter the data
hpc <- hpc[(hpc$Date=="1/2/2007")|(hpc$Date=="2/2/2007"),]
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc <- na.omit(hpc)

## Make Plots
# plot2.png
hpc$DateTime <- paste(hpc$Date, hpc$Time)
hpc$DateTime <- strptime(hpc$DateTime, format="%d/%m/%Y %H:%M:%S")
png(filename="plot2.png")
plot(hpc$DateTime, hpc$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
