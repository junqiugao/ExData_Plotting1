rawdata <- read.table(".//household_power_consumption.txt", sep = ";", header = TRUE)
HPC <- rawdata[rawdata$Date == "1/2/2007"| rawdata$Date == "2/2/2007", ]
globalActivePower <- as.numeric(HPC$Global_active_power)
datetime <- strptime(paste(HPC$Date, HPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
dev.off()