#getwd()
#setwd("C:/Users/franny.delaney/Documents/Analytics/R/ExData_Plotting1")

#get file from internet
dl<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",dl)

#read in file
file<-read.table(unz(dl,"household_power_consumption.txt"),na.strings="?",sep=";",header=TRUE,stringsAsFactors=FALSE)

#subset file, create date+time column, modify formats
sfile<-file[file$Date %in% c("1/2/2007","2/2/2007"),]
sfile<-cbind(DateTime=paste(sfile$Date,sfile$Time),sfile)
sfile$Date<-as.Date(sfile$Date,"%d/%m/%Y")
sfile$DateTime<-strptime(sfile$DateTime,format="%d/%m/%Y %T")

#send graph to file
png(file="plot4.png",width=480,height=480)
#setting 2x2 plot layout
par(mfrow=c(2,2))

#top left chart
plot(
    sfile$DateTime
    ,sfile$Global_active_power
    ,type="l"
    ,ylab="Global Active Power"
    ,xlab='')


#top right chart
plot(
    sfile$DateTime
    ,sfile$Voltage
    ,type="l"
    ,ylab="Voltage"
    ,xlab='datetime')

#bottom left chart
plot(
    sfile$DateTime
    ,sfile$Sub_metering_1
    ,type="n"
    ,ylab="Energy sub metering"
    ,xlab='')

lines(sfile$DateTime,sfile$Sub_metering_1)
lines(sfile$DateTime,sfile$Sub_metering_2,col="red")
lines(sfile$DateTime,sfile$Sub_metering_3,col="blue")

legend(
    "topright"
    ,col=c("black","red","blue")
    ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
    ,lty=1)

#bottom right chart
plot(
    sfile$DateTime
    ,sfile$Global_reactive_power
    ,type="l"
    ,ylab="Global_reactive_power"
    ,xlab='datetime')

dev.off()