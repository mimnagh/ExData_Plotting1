data<-read.table("household_power_consumption.txt",sep=";",header=T,na.strings=c("?"))
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
end<-as.Date("2007-02-02","%Y-%m-%d")
start<-as.Date("2007-02-01","%Y-%m-%d")
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$Time<-strptime(data$Time,"%H:%M:%S")
result <-data[data$Date>=start & data$Date<=end,]
png(filename="plot4.png",width=480,height=480)
par(mfrow=c(2,2))

plot(result$DateTime,result$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(result$DateTime,result$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(result$DateTime,result$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
colors<-c("black","red","blue")
labels<-paste("Sub_metering_",seq(3),sep="")
for(i in seq(3)){
  points(result[["DateTime"]],result[[labels[i]]],col=colors[i],type="l")
}
legend("topright",lwd=1,col=colors,legend=labels,bty="n")

plot(result$DateTime,result$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()