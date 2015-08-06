setwd("C:/Users/Catarina/Desktop/Specialization in Data Science/04. Exploratory Data Analysis/01. Week 1/Project")

## Loading Data
data <- read.table("C:/Users/Catarina/Desktop/Specialization in Data Science/04. Exploratory Data Analysis/01. Week 1/Project/household_power_consumption.txt", sep=';', na.strings="?", header = TRUE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting
sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates
datetime <- paste(as.Date(sub$Date), sub$Time)
sub$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(sub$Global_active_power~sub$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()