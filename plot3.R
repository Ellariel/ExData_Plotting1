library(data.table)

data <- as.data.table(read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";", dec=".", na.strings = "?"))

data <- data[Date == "1/2/2007" | Date == "2/2/2007"]

png(file = "plot3.png", width = 480, height = 480, bg = "transparent")

plot(as.numeric(data$Sub_metering_1),
     type = "s",
     ylab = "Energy sub metering",
     xlab = "",
     xaxt="n"
    )

lines(as.numeric(data$Sub_metering_2), col = "red")
lines(as.numeric(data$Sub_metering_3), col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = c(1, 1, 1)
       )

width <- nrow(data)

axis(side=1,at=c(0,width/2,width),labels=c("Thu","Fri","Sat"))


dev.flush()
dev.off()