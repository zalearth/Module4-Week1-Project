file <- "household_power_consumption.txt"

# read file data
rawdata <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE)

# getting data dated from 1/2/2007 to 2/2/2007 only
data <- rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007") ,]

# create column in table by merging date & time
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data <- cbind(data, datetime)

# ploting graph to png file device
png("plot3.png", width=480, height=480)

plot(datetime, as.numeric(data$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(datetime, as.numeric(data$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(data$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()