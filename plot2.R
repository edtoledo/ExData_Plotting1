## Read data
data<-read.csv("~/Rprojects/household_power_consumption.txt",na.strings="?",sep=";",stringsAsFactors=F)

## Extract data from the dates 2007-02-01 and 2007-02-02
filter<-data$Date=="1/2/2007"|data$Date=="2/2/2007"
datafilter<-data[filter,]

## Convert date and time from character to date and time
datafilter$datetime<-strptime(paste(datafilter$Date,datafilter$Time),"%d/%m/%Y %H:%M:%S")

##Plot graph and save as PNG
plot(datafilter$datetime,datafilter$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()