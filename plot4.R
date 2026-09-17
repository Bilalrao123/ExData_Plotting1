## plot4.R
## Course Project 1 - Plot 4: Four panel plot combining Global Active Power,
## Voltage, Energy Sub Metering, and Global Reactive Power over time.
## Saved as plot4.png (480x480).

## ---- Load and subset the data ----

data_full <- read.table("household_power_consumption.txt",
                         header = TRUE,
                         sep = ";",
                         na.strings = "?",
                         stringsAsFactors = FALSE)

data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

data <- subset(data_full, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

data$Global_active_power   <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage                <- as.numeric(data$Voltage)
data$Sub_metering_1         <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2         <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3         <- as.numeric(data$Sub_metering_3)

data$Datetime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

## ---- Create the plot ----

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Top left: Global Active Power over time
plot(data$Datetime, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# Top right: Voltage over time
plot(data$Datetime, data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# Bottom left: Energy sub metering with legend (no box around legend)
plot(data$Datetime, data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lty = 1,
       bty = "n")

# Bottom right: Global Reactive Power over time
plot(data$Datetime, data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()
