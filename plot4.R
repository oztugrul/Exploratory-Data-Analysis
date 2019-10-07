setwd("C:/Users/asus/Desktop/Exploratory Data Analysis/exdata_data_household_power_consumption")

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

data$Date<-as.Date(data$Date,format="%d/%m/%Y")

data_subset<-subset(data,subset=(Date>="2007-02-01"&Date<="2007-02-02"))

data_subset$Global_active_power<-as.numeric(as.character(data_subset$Global_active_power))

date_time<-paste(data_subset$Date,data_subset$Time)

data_subset$Date_Time<-as.POSIXct(date_time)

par(mfrow=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

with(data_subset,{
  plot(Global_active_power~Date_Time,type="l",ylab="Global Active Power (kilowatts)",xlab="")
  
  plot(Voltage~Date_Time,type="l",ylab="Voltage (Volt)",xlab="datetime")
  
  plot(Sub_metering_1~Date_Time,type="l",ylab="Global Active Power (kilowatts)",xlab="")
  
  lines(Sub_metering_2~Date_Time,col="red")
  
  lines(Sub_metering_3~Date_Time,col="blue")
  
  legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2,bty = "n")
  
  plot(Global_reactive_power~Date_Time,type="l",ylab="Global Reactive Power (kilowatts)",xlab="datetime",ylim=c(0,0.5))
})

dev.copy(png,file="plot4.png",height=480,width=480)

dev.off()
