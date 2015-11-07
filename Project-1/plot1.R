## Load data set
dframe <- read.table(file = "household_power_consumption.txt", sep=";", na.strings = c(NA, "?"),
                     dec = ".", header = TRUE)

## Coercing date and time vectors in data frame
dframe$Date <- as.Date(dframe$Date, "%d/%m/%Y")
dframe$Time <- strptime(paste(dframe$Date, dframe$Time), "%Y-%m-%d %H:%M:%S")

## Subsetting data with dates: 2007/02/01 and 2007/02/02
date1 <- as.Date("2007/02/01", "%Y/%m/%d") 
date2 <- as.Date("2007/02/02", "%Y/%m/%d")
subframe <- subset(dframe, Date %in%  c(date1, date2) )
rm(dframe, date1, date2) # Freeing up useless variables

## Plot 1- Histogram for Global Active Power
png("plot1.png")
hist(x= subframe$Global_active_power, xlab = "Global Active Power(kilowatts)",
     col = "red", main = "Global Active Power")
dev.off()



