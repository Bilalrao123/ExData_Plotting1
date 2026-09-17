## plot3.R
## Course Project 1 - Plot 3: Energy Sub Metering over time
## Reads household_power_consumption.txt, subsets to 2007-02-01 and 2007-02-02,
## and creates a line plot of the three sub-metering variables, with a legend,
## saved as plot3.png (480x480).

## ---- Load and subset the data ----

data_full <- read.table("household_power_consumption.txt",
                         header = TRUE,
                         sep = ";",
                         na.strings = "?",
                         stringsAsFactors = FALSE)

data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

data <- subset(data_full, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

data$Datetime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

## ---- Create the plot ----

png("plot3.png", width = 480, height = 480)

plot(data$Datetime, data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1)

dev.off()
