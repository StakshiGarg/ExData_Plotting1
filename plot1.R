## check if file exists

if (!file.exists("household_power_consumption.txt")){
	return ("No such file")
}
#read file to power
power<-read.table("household_power_consumption.txt", sep=";",header=TRUE)
#get relevant subset of data
power<-power[power$Date == "1/2/2007" | power$Date =="2/2/2007",]
#convert date feild to date
power$Date<-gsub("/","-",power$Date)
power$Date<-as.Date(as.character(power$Date),"%d-%m-%Y")
#convert time to time 
power$Time<-format(strptime(power$Time,"%H:%M:%S"),"%H:%M:%S")
#chnage field to plot to numeric
power$Global_active_power<-as.numeric(as.character(power$Global_active_power))
#draw histogram
with (power, hist(Global_active_power, col="Red",xlab="Global Active Power (kilowatts)",main="Global Active Power"))
#save to png at specified height
# one option : dev.print(device=png, width=480, height=480, file = "plot1.png")
dev.copy(png, width=480, height=480, file = "plot1.png")
#close connection
dev.off()