## Loading Data
data <- read.table("C:/Users/Catarina/Desktop/Specialization in Data Science/04. Exploratory Data Analysis/01. Week 1/Project/household_power_consumption.txt", sep=';', na.strings="?", header = TRUE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting
sub <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))


## Converting dates
datetime <- paste(as.Date(sub$Date), sub$Time)
sub$Datetime <- as.POSIXct(datetime)

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1))
with(sub, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power", xlab="")
  
  plot(Voltage~Datetime, type="l", ylab="Voltage", xlab="datetime")
  
  plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", lty = 1, bty = "n", cex=0.2, col = c("black", "red", "blue"), 
         legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~Datetime, type="l", ylab="Global_reactive_power",xlab="datetime")
})

## Save to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()