
data <- read.table("household_power_consumption.txt", header=T, sep=";")

sdata <- subset(data, data$Date == "1/2/2007"|data$Date == "2/2/2007")
sdata$DateTime <- paste(sdata$Date, sdata$Time)
sdata$DateTime <- strptime(sdata$DateTime, format = "%d/%m/%Y %H:%M:%S")
sdata$Global_active_power <- as.numeric(as.character(sdata$Global_active_power))
sdata$Global_reactive_power <- as.numeric(as.character(sdata$Global_reactive_power))
sdata$Voltage <- as.numeric(as.character(sdata$Voltage))
sdata$Sub_metering_1 <- as.numeric(as.character(sdata$Sub_metering_1))
sdata$Sub_metering_2 <- as.numeric(as.character(sdata$Sub_metering_2))
sdata$Sub_metering_3 <- as.numeric(as.character(sdata$Sub_metering_3))

plot1 <- function() {
        hist(sdata$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
        dev.copy(png, file="plot1.png", width=480, height=480)
        dev.off()
        cat("Plot1.png has been saved in", getwd())
}
plot1()
