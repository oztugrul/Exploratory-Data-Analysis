setwd("C:/Users/asus/Desktop/Exploratory Data Analysis/exdata_data_household_power_consumption")

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

data$Date<-as.Date(data$Date,format="%d/%m/%Y")

data_subset<-subset(data,subset=(Date>="2007-02-01"&Date<="2007-02-02"))

data_subset$Global_active_power<-as.numeric(as.character(data_subset$Global_active_power))

date_time<-paste(data_subset$Date,data_subset$Time)

data_subset$Date_Time<-as.POSIXct(date_time)

plot(data_subset$Date_Time,data_subset$Sub_metering_1,type="l",ylab="Global Active Power (kilowatts)",xlab="")

lines(data_subset$Date_Time,data_subset$Sub_metering_2,col="red")

lines(data_subset$Date_Time,data_subset$Sub_metering_3,col="blue")

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,lwd=2)

dev.copy(png,file="plot3.png",height=480,width=480)

dev.off()