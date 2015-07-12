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
plot4 <- function() {
        par(mfrow=c(2,2))
        
        ##PLOT 1
        plot(sdata$DateTime,sdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
        ##PLOT 2
        plot(sdata$DateTime,sdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
        
        ##PLOT 3
        plot(sdata$DateTime,sdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(sdata$DateTime,sdata$Sub_metering_2,col="red")
        lines(sdata$DateTime,sdata$Sub_metering_3,col="blue")
        legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
        
        #PLOT 4
        plot(sdata$DateTime,sdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
        
        #OUTPUT
        dev.copy(png, file="plot4.png", width=480, height=480)
        dev.off()
        cat("plot4.png has been saved in", getwd())
}
plot4()
