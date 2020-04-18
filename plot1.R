library(data.table)

data <- as.data.table(read.table(unz("exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), header=T, sep=";", dec=".", na.strings = "?"))

data <- data[Date == "1/2/2007" | Date == "2/2/2007"]

png(file = "plot1.png", width = 480, height = 480, bg = "transparent")

hist(as.numeric(data$Global_active_power), 
     main = "Global Active Power", 
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     breaks = 24)

dev.flush()
dev.off()