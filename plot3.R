rm(list=ls())

datapower <- read.csv("/home/panthera_joleen/Music/Data Science Specialization/DSS_4_Exploratory_Data/Quizz1/household_power_consumption.txt", 
                       sep=";", 
                       header = TRUE,
                       na.strings="?")

datapower <- subset(datapower, as.Date(datapower$Date, "%d/%m/%Y")>"2007-01-31")
datapower <- subset(datapower, as.Date(datapower$Date, "%d/%m/%Y")<"2007-02-03")
datapower$Date_Time <- strptime(paste(datapower$Date, datapower$Time), "%d/%m/%Y %H:%M:%S")

with(datapower, plot(Date_Time, Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering"))
lines(datapower$Date_Time, datapower$Sub_metering_2, type="l", col="red")
lines(datapower$Date_Time, datapower$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file="plot3.png")
dev.off()
