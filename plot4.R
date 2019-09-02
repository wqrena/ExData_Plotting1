library(lubridate)
library(dplyr)

# Read and subset data
data<- read.csv("household_power_consumption.txt", sep=";", na.strings = c("NA", "?"), stringsAsFactors = F)
odata <- data %>% filter(Date %in% c("1/2/2007","2/2/2007"))

# Create Datetime variable
odata$Datetime <- paste(odata$Date, "T",odata$Time)

# Convert Datetime from character to Date/Time classes
odata$Datetime <- dmy_hms(odata$Datetime)

# plot to create png file
par(mfrow=c(2,2))
with(odata, plot(Datetime, Global_active_power, type="l",xlab="", ylab = "Global Active Power (kilowatts)" ))

with(odata, plot(Datetime, Voltage, type="l",xlab="", ylab = "Voltage" ))

with(odata, plot(Datetime, Sub_metering_1,col="black",type="l",xlab= "", ylab = "Energy sub metering" ))
lines(odata$Datetime, odata$Sub_metering_2, col="red")
lines(odata$Datetime, odata$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lwd=1, lty=c(1,1,1), cex=0.30)

with(odata, plot(Datetime, Global_reactive_power, type="l",xlab="datetime", ylab = NULL ))
