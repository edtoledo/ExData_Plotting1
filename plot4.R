## Read data
data<-read.csv("~/Rprojects/household_power_consumption.txt",na.strings="?",sep=";",stringsAsFactors=F)

## Extract data from the dates 2007-02-01 and 2007-02-02
filter<-data$Date=="1/2/2007"|data$Date=="2/2/2007"
datafilter<-data[filter,]

## Convert date and time from character to date and time
datafilter$datetime<-strptime(paste(datafilter$Date,datafilter$Time),"%d/%m/%Y %H:%M:%S")

##Plot graph and save as PNG
par(mfrow=c(2,2))
with(datafilter,{
        plot(datetime,Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowatts)")
        plot(datetime,Voltage , type="l",xlab="",ylab="Voltage")
        plot(datetime,Sub_metering_1, type="l",
             ylab="Energy sub metering", xlab="")
        lines(datetime,Sub_metering_2,col='Red')
        lines(datetime,Sub_metering_3,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(datetime,Global_reactive_power , type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()