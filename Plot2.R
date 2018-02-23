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

## Plot2
plot(selected$Global_active_power~selected$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Save as plot2.png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()