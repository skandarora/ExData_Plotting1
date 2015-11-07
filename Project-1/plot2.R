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

## Plot 2- Plot for Global Active Power wrt Day
png("plot2.png")
with(sf, plot(Time, Global_active_power, 
                    type="l", xlab="",ylab = "Global Active Power(kilowatts)" ))
dev.off()