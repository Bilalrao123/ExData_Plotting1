## plot2.R
## Course Project 1 - Plot 2: Global Active Power over time (line plot)
## Reads household_power_consumption.txt, subsets to 2007-02-01 and 2007-02-02,
## and creates a line plot of Global Active Power vs time, saved as plot2.png (480x480).

## ---- Load and subset the data ----

data_full <- read.table("household_power_consumption.txt",
                         header = TRUE,
                         sep = ";",
                         na.strings = "?",
                         stringsAsFactors = FALSE)

data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

data <- subset(data_full, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

data$Global_active_power <- as.numeric(data$Global_active_power)

# Combine Date and Time into a single Datetime column
data$Datetime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

## ---- Create the plot ----

png("plot2.png", width = 480, height = 480)

plot(data$Datetime, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
