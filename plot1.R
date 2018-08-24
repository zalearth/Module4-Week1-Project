file <- "household_power_consumption.txt"

# read data
rawdata <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE)

# subsetting data (getting Global Active Power data dated from 1/2/2007 to 2/2/2007 only)
data <- rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007") , ]

# ploting graph to png file device
png("plot1.png", width=480, height=480)

hist(as.numeric(data$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()