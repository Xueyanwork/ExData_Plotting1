fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="household_power_consumption.zip")
powerConsumption <- read.table(unz("household_power_consumption.zip", "household_power_consumption.txt"),header=T, sep=";")
powerConsumption2 <- powerConsumption[as.character(powerConsumption$Date) %in% c("1/2/2007", "2/2/2007"),]
powerConsumption2$dateTime = paste(powerConsumption2$Date, powerConsumption2$Time)
powerConsumption2$dateTime <- strptime(powerConsumption2$dateTime, "%d/%m/%Y %H:%M:%S")
attach(powerConsumption2)
png("plot1.png", width=480, height=480, units="px")
hist(as.numeric(as.character(Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()