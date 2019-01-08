library(readr)
library(lubridate)

# load data
hpc <- read_delim('../household_power_consumption.txt',';',na=c("","NA","?"))

# convert Date to Date
hpc$Date <- dmy(hpc$Date)

# subset to 2/1 and 2/2/2007
hpc2 <- subset(hpc, Date == ymd('2007-02-01') | Date == ymd('2007-02-02'))

#createDateTime Variable
hpc2$DateTime <- ymd_hms(paste(hpc2$Date,hpc2$Time))

# open graphics device
png(filename = "plot4.png")

# set up 2x2 grid of plots
par(mfcol=c(2,2))

# draw graph 1
plot(hpc2$DateTime,hpc2$Global_active_power,type = 'l',
     ylab="Global Active Power (kilowatts)",xlab='')

#draw graph 2
plot(hpc2$DateTime,hpc2$Sub_metering_1,type='l',
     xlab="",ylab="Energy sub metering")
lines(hpc2$DateTime,hpc2$Sub_metering_2,col='red')
lines(hpc2$DateTime,hpc2$Sub_metering_3,col='blue')
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lwd = 1)

#draw graph 3
plot(hpc2$DateTime,hpc2$Voltage,type = 'l',
     ylab="Voltage",xlab='datetime')

#draw graph 4
plot(hpc2$DateTime,hpc2$Global_reactive_power,type = 'l',
     ylab="Global_reactive_power",xlab='datetime')

#close graphics device
dev.off()