library(data.table)

data <- as.data.table(read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";", dec=".", na.strings = "?"))

data <- data[Date == "1/2/2007" | Date == "2/2/2007"]

png(file = "plot4.png", width = 480, height = 480, bg = "transparent")

par(mfcol=c(2,2), mar=c(4,4,2,2))

plot(as.numeric(data$Global_active_power),
     type = "s",
     ylab = "Global Active Power",
     xlab = "",
     xaxt="n"
)

width <- nrow(data)

axis(side=1,at=c(0,width/2,width),labels=c("Thu","Fri","Sat"))

plot(as.numeric(data$Sub_metering_1),
     type = "s",
     ylab = "Energy sub metering",
     xlab = "",
     xaxt="n"
)

lines(as.numeric(data$Sub_metering_2), col = "red")
lines(as.numeric(data$Sub_metering_3), col = "blue")

legend("topright",
       bty = "n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1)
)

axis(side=1,at=c(0,width/2,width),labels=c("Thu","Fri","Sat"))

plot(as.numeric(data$Voltage),
     type = "s",
     ylab = "Voltage",
     xlab = "datetime",
     xaxt="n"
)

axis(side=1,at=c(0,width/2,width),labels=c("Thu","Fri","Sat"))

plot(as.numeric(data$Global_reactive_power),
     type = "s",
     ylab = "Global_reactive_power",
     xlab = "datetime",
     xaxt="n"
)

axis(side=1,at=c(0,width/2,width),labels=c("Thu","Fri","Sat"))

dev.flush()
dev.off()