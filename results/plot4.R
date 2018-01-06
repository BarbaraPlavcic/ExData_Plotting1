## download and unzip (for Windows)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip")
unzip ("data.zip")

## read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
data <- transform(data, Date=as.Date(Date, "%d/%m/%Y"), Time=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
data <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

## plot4
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(data, {
        plot(Time, Global_active_power, type= "l", ylab="Global Active Power", xlab="")
        plot(Time, Voltage, type= "l", ylab="Voltage", xlab = "datetime")
        with(data, {
                plot(Time, Sub_metering_1, type="l",
                     ylab="Energy sub metering", xlab="")
                lines(Time, Sub_metering_2, col='Red')
                lines(Time, Sub_metering_3, col='Blue')
        })
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.5, bty = "n")
        plot(data$Time, data$Global_reactive_power, type= "l", xlab="datetime", ylab="Global_reactive_power")
})

dev.copy(png, "plot4.png", height=480, width=480)
dev.off()