## download and unzip (for Windows)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip")
unzip ("data.zip")

## read data
data <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
data <- transform(data, Date=as.Date(Date, "%d/%m/%Y"), Time=strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
data <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

## plot2
plot(data$Time, data$Global_active_power, type= "l", ylab="Global Active Power (Kilowatts)", xlab="")
dev.copy(png, "plot2.png", height=480, width=480)
dev.off()