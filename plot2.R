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
#change format to time
strptime(power$DateTime,"%d/%m/%Y %H:%M:%S")
#change format of globar active power
power$Global_active_power<-as.numeric(as.character(power$Global_active_power))
#plot with type l
with(power,plot(DateTime, Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l"))
#save tyo file
dev.copy(png, width=480, height=480, file = "plot2.png")
#dev off
dev.off()
