data<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings=c("?"))
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
end<-as.Date("2007-02-02","%Y-%m-%d")
start<-as.Date("2007-02-01","%Y-%m-%d")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-strptime(data$Time,"%H:%M:%S")
result <-data[data$Date>=start & data$Date<=end,]

png(filename="plot2.png",width=480,height=480)
plot(result$DateTime,result$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()