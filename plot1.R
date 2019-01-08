library(readr)
library(lubridate)

# load data
hpc <- read_delim('../household_power_consumption.txt',';',na=c("","NA","?"))

# convert Date to Date
hpc$Date <- dmy(hpc$Date)

# subset to 2/1 and 2/2/2007
hpc2 <- subset(hpc, Date == ymd('2007-02-01') | Date == ymd('2007-02-02'))

# open graphics device
png(filename = "plot1.png")

# draw histogram
hist(hpc2$Global_active_power, col = 'red', main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

#close graphics device
dev.off()


