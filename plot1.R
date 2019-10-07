setwd("C:/Users/asus/Desktop/Exploratory Data Analysis/exdata_data_household_power_consumption")

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")

data$Date<-as.Date(data$Date,format="%d/%m/%Y")

data_subset<-subset(data,subset=(Date>="2007-02-01"&Date<="2007-02-02"))

data_subset$Global_active_power<-as.numeric(as.character(data_subset$Global_active_power))

hist(data_subset$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",
     main="Global Active Power")

dev.copy(png,file="plot1.png",height=480,width=480)

dev.off()
