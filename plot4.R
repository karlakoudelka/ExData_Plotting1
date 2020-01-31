#Week 1 assignment
#Run lines below to download the needed data set to your working directory
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "dataset.zip", method = "curl")
unzip("dataset.zip") 

#The lines below create a new data object containing the household power consumption data
#Next, the code subsets the object to only the needed dates in February and makes needed format changes
data<-read.delim("household_power_consumption.txt", header=TRUE, sep=";", na.strings=c("?"))
data<-subset(data[which(data$Date %in% c("1/2/2007", "2/2/2007")),])
data$datetime<-strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)

#Code to create plot 4 and send to png file
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data$datetime, data$Global_active_power, type="n",xlab="", ylab="Global Active Power")
lines(data$datetime, data$Global_active_power, xlab="")
plot(data$datetime, data$Voltage, type="n", xlab="datetime",ylab="Voltage")
lines(data$datetime, data$Voltage, xlab="")
plot(data$datetime, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_1, col="black")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data$datetime, data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(data$datetime, data$Global_reactive_power)
dev.off()
