setwd("~/Desktop/Coursera/ExpDataAnalysis")
# Uncomment for file chooser
#PowerCons <- read.csv(file.choose(), sep=";", na.strings="?", colClasses=c("character", "character", rep("numeric",7)))
# Comment nextline for file chooser
PowerCons <- read.csv("~/Desktop/Coursera/ExpDataAnalysis/household_power_consumption.txt", sep=";", na.strings="?", colClasses=c("character", "character", rep("numeric",7)))
PowerCons$DateTime <- with(PowerCons, paste(Date,Time, sep=", "))
PowerCons$DateTime<- strptime(PowerCons$DateTime, "%d/%m/%Y, %H:%M:%S")
PowerCons$Date <- NULL
PowerCons$Time <- NULL
PowerCons <- PowerCons[c(8,1:7)]
PowerConsFeb07 <- subset(PowerCons, DateTime > strptime("2007-01-31", "%Y-%m-%d") & DateTime < strptime("2007-02-03", "%Y-%m-%d"))
rownames(PowerConsFeb07) <- seq_len(nrow(PowerConsFeb07))

# Plot 3
png("plot3.png", width=480, height=480)
  plotcolors <- c("black", "red", "blue")
  plot(PowerConsFeb07$DateTime,PowerConsFeb07$Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering")
  lines(PowerConsFeb07$DateTime,PowerConsFeb07$Sub_metering_2, col="red", type="l")
  lines(PowerConsFeb07$DateTime,PowerConsFeb07$Sub_metering_3, col="blue", type="l")
  legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=plotcolors, pch="-")
dev.off()