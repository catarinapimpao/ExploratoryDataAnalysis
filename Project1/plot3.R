## Loading Data
data <- read.table("C:/Users/Catarina/Desktop/Specialization in Data Science/04. Exploratory Data Analysis/01. Week 1/Project/household_power_consumption.txt", sep=';', na.strings="?", header = TRUE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting
sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates
datetime <- paste(as.Date(sub$Date), sub$Time)
sub$Datetime <- as.POSIXct(datetime)

## Plot 3
with(sub, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"),  lty=1, lwd=2,cex=0.32, xjust=1,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()