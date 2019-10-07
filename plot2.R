setwd("C:/Users/asus/Desktop/Exploratory Data Analysis/exdata_data_household_power_consumption")

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

data$Date<-as.Date(data$Date,format="%d/%m/%Y")

data_subset<-subset(data,subset=(Date>="2007-02-01"&Date<="2007-02-02"))

data_subset$Global_active_power<-as.numeric(as.character(data_subset$Global_active_power))

date_time<-paste(data_subset$Date,data_subset$Time)

data_subset$Date_Time<-as.POSIXct(date_time)


plot(Global_active_power ~ Date_Time,data=data_subset,type="l", xlab= "", ylab="Global Active power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()

