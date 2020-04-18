library(data.table)

data <- as.data.table(read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";", dec=".", na.strings = "?"))

data <- data[Date == "1/2/2007" | Date == "2/2/2007"]

png(file = "plot2.png", width = 480, height = 480, bg = "transparent")

plot(as.numeric(data$Global_active_power),
     type = "s",
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     xaxt="n"
)

width <- nrow(data)

axis(side=1,at=c(0,width/2,width),labels=c("Thu","Fri","Sat"))


dev.flush()
dev.off()