## Load data set
df <- read.table(file = "household_power_consumption.txt", sep=";", na.strings = c(NA, "?"),
                 dec = ".", header = TRUE)

## Coercing date and time vectors in data frame
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Time <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

## Subsetting data with dates: 2007/02/01 and 2007/02/02
date1 <- as.Date("2007/02/01", "%Y/%m/%d") 
date2 <- as.Date("2007/02/02", "%Y/%m/%d")
sf <- subset(df, Date %in%  c(date1, date2) )
rm(df, date1, date2) # Freeing up useless variables

## Plot 3
png("plot3.png")
plot(sf$Time, sf$Sub_metering_1, xlab="", ylab = "Energy sub metering", type="l")
lines(sf$Time, sf$Sub_metering_2, col="Red")
lines(sf$Time, sf$Sub_metering_3, col="Blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
              col=c("Black", "Blue", "Red"), lty=1, lwd=3)
dev.off()
