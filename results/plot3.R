## download and unzip (for Windows)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip")
unzip ("data.zip")

## read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
data <- transform(data, Date=as.Date(Date, "%d/%m/%Y"), Time=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
data <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

## plot3
png(file = "plot3.png", width = 480, height = 480)
with(data, {
        plot(Time, Sub_metering_1, type="l",
             ylab="Energy sub metering", xlab="")
        lines(Time, Sub_metering_2, col='Red')
        lines(Time, Sub_metering_3, col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)
dev.off()