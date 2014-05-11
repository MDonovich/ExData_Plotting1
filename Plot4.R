setwd("~/Desktop/Coursera/ExpDataAnalysis")
# Uncomment for file chooser
#PowerCons <- read.csv(file.choose(), sep=";", na.strings="?", colClasses=c("character", "character", rep("numeric",7)))
# Comment next line for file chooser
PowerCons <- read.csv("~/Desktop/Coursera/ExpDataAnalysis/household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("character", "character", rep("numeric",7)))
PowerCons$DateTime <- with(PowerCons, paste(Date,Time, sep=", "))
PowerCons$DateTime<- strptime(PowerCons$DateTime, "%d/%m/%Y, %H:%M:%S")
PowerCons$Date <- NULL
PowerCons$Time <- NULL
PowerCons <- PowerCons[c(8,1:7)]
PowerConsFeb07 <- subset(PowerCons, DateTime > strptime("2007-01-31", "%Y-%m-%d") & DateTime < strptime("2007-02-03", "%Y-%m-%d"))
rownames(PowerConsFeb07) <- seq_len(nrow(PowerConsFeb07))

# Plot 4
png("plot4.png", width=480, height=480)
  par(mfrow=c(2,2))
  par(mar=c(2,4,2,1))
  # Panel 1 (Top Left)
  plot(PowerConsFeb07$DateTime,PowerConsFeb07$Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)", cex.axis=0.75, cex.lab=0.75)

  # Panel 2 (Top Right)
  plot(PowerConsFeb07$DateTime,PowerConsFeb07$Voltage, type="l", main="", xlab="datetime", ylab="Voltage", cex.axis=0.75, cex.lab=0.75)

  # Panel 3 (Bottom Left)
  plotcolors <- c("black", "red", "blue")
  plot(PowerConsFeb07$DateTime,PowerConsFeb07$Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering", cex.axis=0.75, cex.lab=0.75)
  lines(PowerConsFeb07$DateTime,PowerConsFeb07$Sub_metering_2, col="red", type="l")
  lines(PowerConsFeb07$DateTime,PowerConsFeb07$Sub_metering_3, col="blue", type="l")
  legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=plotcolors,cex=0.75, pch="-")

  # Panel 4 (Bottom Right)
  plot(PowerConsFeb07$DateTime,PowerConsFeb07$Global_reactive_power, type="l", main="", xlab="datetime", ylab="Global_reactive_power", cex.axis=0.75, cex.lab=0.75)
dev.off()
