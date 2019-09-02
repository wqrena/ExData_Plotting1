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
png("plot2.png", width = 480, height = 480, units = "px")
with(odata, plot(Datetime, Global_active_power, type="l",xlab="", ylab = "Global Active Power (kilowatts)" ))
dev.off()


