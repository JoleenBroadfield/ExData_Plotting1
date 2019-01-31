rm(list=ls())

datapower <- read.csv("/home/panthera_joleen/Music/Data Science Specialization/DSS_4_Exploratory_Data/Quizz1/household_power_consumption.txt", 
                      sep=";", 
                      header = TRUE,
                      na.strings="?")

datapower <- subset(datapower, as.Date(datapower$Date, "%d/%m/%Y")>"2007-01-31")
datapower <- subset(datapower, as.Date(datapower$Date, "%d/%m/%Y")<"2007-02-03")
datapower$Date_Time <- strptime(paste(datapower$Date, datapower$Time), "%d/%m/%Y %H:%M:%S")

hist(datapower$Global_active_power, main="Global Active Power", col="red", 
     xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png")
dev.off()


