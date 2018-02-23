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

##Plot3
with(selected, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

## Save as plot3.png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()