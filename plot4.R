rawdata <- read.table(".//household_power_consumption.txt", sep = ";", header = TRUE)
HPC <- rawdata[rawdata$Date == "1/2/2007"| rawdata$Date == "2/2/2007", ]
datetime <- strptime(paste(HPC$Date, HPC$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(HPC$Global_active_power)
Submetering1 <- as.numeric(HPC$Sub_metering_1)
Submetering2 <- as.numeric(HPC$Sub_metering_2)
Submetering3 <- as.numeric(HPC$Sub_metering_3)
voltage <- as.numeric(HPC$Voltage)
globalreactivepower <- as.numeric(HPC$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfcol = c(2,2))
with(HPC,{
        hist(globalActivePower, main = " ", col="red", xlab = "Global Active Power",xlim=c(0,5000))

        plot(datetime, Submetering1, type="l", xlab = "", ylab = "Energy sub metering")
         lines(datetime, Submetering2, col= "red")
         lines(datetime, Submetering3, col= "blue")
         legend("topright",lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        
        plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "voltage") 
        
        plot(datetime, globalreactivepower, type = "l",xlab = "datetime", ylab = "global_reactive_power")
        
})
dev.off()
