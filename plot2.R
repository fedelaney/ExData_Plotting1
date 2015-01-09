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
png("plot2.png",width=480,height=480)
plot(
    sfile$DateTime
    ,sfile$Global_active_power
    ,type="l"
    ,ylab="Global Active Power (kilowatts)"
    ,xlab='')
dev.off()
