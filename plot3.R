## check if file exists

if (!file.exists("household_power_consumption.txt")){
	return ("No such file")
}
#read file to power
power<-read.table("household_power_consumption.txt", sep=";",header=TRUE)
#get relevant subset of data
power<-power[power$Date == "1/2/2007" | power$Date =="2/2/2007",]
#combine date time data to new class
power$DateTime = paste(as.character(power$Date),as.character(power$Time))
#chnage format to time
strptime(power$DateTime,"%d/%m/%Y %H:%M:%S")
#change format 
power$Sub_metering_3 <-as.numeric(as.character(power$Sub_metering_3))
power$Sub_metering_2 <-as.numeric(as.character(power$Sub_metering_2))
power$Sub_metering_1 <-as.numeric(as.character(power$Sub_metering_1))

#plot with type s
with(power,plot(DateTime, Sub_metering_1,xlab="",ylab="Energy Sub Metering",type="s"))
with(power,lines(DateTime, Sub_metering_2,col="red"))
with(power,lines(DateTime, Sub_metering_3,col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = c("solid"), pch = c(" "," ", " "),col = c("black","red", "blue"),lwd = c(1,1))
#save tyo file
dev.copy(png, width=480, height=480, file = "plot3.png")
#dev off
dev.off()
