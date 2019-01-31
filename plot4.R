rm(list=ls())

datapower <- read.csv("/home/panthera_joleen/Music/Data Science Specialization/DSS_4_Exploratory_Data/Quizz1/household_power_consumption.txt", 
                      sep=";", 
                      header = TRUE,
                      na.strings="?")

datapower <- subset(datapower, as.Date(datapower$Date, "%d/%m/%Y")>"2007-01-31")
datapower <- subset(datapower, as.Date(datapower$Date, "%d/%m/%Y")<"2007-02-03")
datapower$Date_Time <- strptime(paste(datapower$Date, datapower$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow = c(2,2), mai = c(0.7, 0.9, 0.4, 0.4))
with(datapower, plot(Date_Time, Global_active_power, 
                      type="l", xlab="", ylab="Global Active Power"))
with(datapower, plot(Date_Time, Voltage, type="l", xlab="datetime"))
with(datapower, plot(Date_Time, Sub_metering_1, 
                      type="l", xlab="", ylab="Energy sub metering"))
lines(datapower$Date_Time, datapower$Sub_metering_2, type="l", col="red")
lines(datapower$Date_Time, datapower$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), box.lty=0, cex=0.7, lty=1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(datapower, plot(Date_Time, Global_reactive_power, 
                      type="l", xlab="datetime", ylab="Global_reactive_power"))
dev.copy(png, file="plot4.png")
dev.off()
