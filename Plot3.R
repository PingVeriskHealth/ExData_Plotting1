# Read in Data and only subset the part that we need for the class
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data)

# make plot
sub_Data$Global_active_power <- as.numeric(sub_Data$Global_active_power)

subMetering1 <- as.numeric(sub_Data$Sub_metering_1)
subMetering2 <- as.numeric(sub_Data$Sub_metering_2)
subMetering3 <- as.numeric(sub_Data$Sub_metering_3)

datetime <- strptime(paste(sub_Data$Date, sub_Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
