## Fetch
inf <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
inf$Date <- as.Date(inf$Date, format="%d/%m/%Y")

## Subset
selected <- subset(inf, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(inf)

## Convert Date/Time
sFile <- paste(as.Date(selected$Date), selected$Time)
selected$Datetime <- as.POSIXct(sFile)

## Plot1
hist(selected$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save as plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

