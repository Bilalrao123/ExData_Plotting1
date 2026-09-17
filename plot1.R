## plot1.R
## Course Project 1 - Plot 1: Histogram of Global Active Power
## Reads household_power_consumption.txt, subsets to 2007-02-01 and 2007-02-02,
## and creates a histogram of Global Active Power, saved as plot1.png (480x480).

## ---- Load and subset the data ----

# Read only the header first to know column names/types isn't necessary here;
# we read the whole file with appropriate NA string, then subset by date.
# (For very large files you could instead skip/read only the relevant rows,
# but this straightforward approach works fine on a modern machine.)

data_full <- read.table("household_power_consumption.txt",
                         header = TRUE,
                         sep = ";",
                         na.strings = "?",
                         stringsAsFactors = FALSE)

# Convert Date column to Date class for subsetting
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")

# Subset to the two days of interest
data <- subset(data_full, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Global_active_power needs to be numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

## ---- Create the plot ----

png("plot1.png", width = 480, height = 480)

hist(data$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
