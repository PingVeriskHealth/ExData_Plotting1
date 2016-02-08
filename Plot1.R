
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_Data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
rm(data)
#str(subSetData)
sub_Data$Global_active_power <- as.numeric(sub_Data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(sub_Data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
