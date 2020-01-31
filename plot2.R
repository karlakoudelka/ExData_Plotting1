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

#Code to create plot 2 and send to png file
png(filename="plot2.png", width=480, height=480)
plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowats)")
dev.off()
