library(lubridate)
library(dplyr)

# Read and subset data
data<- read.csv("household_power_consumption.txt", sep=";", na.strings = c("NA", "?"), stringsAsFactors = F)
odata <- data %>% filter(Date %in% c("1/2/2007","2/2/2007"))

# Convert Date/Time to Date/Time classes
odata$Date <- dmy(odata$Date)
odata$Time <- hms(odata$Time)

# plot to create png file
png("plot1.png", width = 480, height = 480, units = "px")
hist(odata$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

