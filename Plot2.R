# Read in Data and only subset the part that we need for the class
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data)

# make plot
sub_Data$Global_active_power <- as.numeric(sub_Data$Global_active_power)

# sub_Data <- transform(sub_Data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

# datetime <- paste(as.Date(data$Date), data$Time)
# data$Datetime <- as.POSIXct(datetime)

datetime <- strptime(paste(sub_Data$Date, sub_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)
plot(datetime, sub_Data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
