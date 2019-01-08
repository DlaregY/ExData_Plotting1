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
png(filename = "plot2.png")

# draw graph
plot(hpc2$DateTime,hpc2$Global_active_power,type = 'l',
     ylab="Global Active Power (kilowatts)",xlab='')

#close graphics device
dev.off()