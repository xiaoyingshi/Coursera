## Load the data
setwd('Coursera/ExploratoryDataAnalysis/ExData_Plotting1')
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
