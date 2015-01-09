#getwd()
#setwd("C:/Users/franny.delaney/Documents/Analytics/R/ExData_Plotting1")

#get file from internet
dl<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",dl)

#read in file
file<-read.table(unz(dl,"household_power_consumption.txt"),na.strings="?",sep=";",header=TRUE,stringsAsFactors=FALSE)

#subset file and modify formats
sfile<-file[file$Date %in% c("1/2/2007","2/2/2007"),]
sfile$Date<-as.Date(sfile$Date,"%d/%m/%Y")

#send graph to file
png("plot1.png",width=480,height=480)
with(sfile,hist(Global_active_power,
                    ylab="Frequency"
                    ,xlab="Global Active Power (kilowatts)"
                    ,main="Global Active Power"
                    ,col="red"))
dev.off()