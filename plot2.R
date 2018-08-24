file <- "household_power_consumption.txt"

# read file data
rawdata <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE)

# getting data dated from 1/2/2007 to 2/2/2007 only
data <- rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007") , ]

# create column in table by merging date & time
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
data <- cbind( data, datetime)

# ploting graph to png file device
png("plot2.png", width=480, height=480)

plot(data$datetime, as.numeric(data$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()