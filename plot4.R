#file path
file <-"household_power_consumption.txt"

#read the file
data <- read.table(file,sep=';',header=TRUE, 
                   colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),
                   na.strings='?')

#converting the date variable type and filtering
data <- subset(data,(as.Date(Date,format="%d/%m/%Y") >= as.Date("2007-02-01") & 
                       as.Date(Date,format="%d/%m/%Y") <= as.Date("2007-02-02")))


data$datetime <-strptime(paste(data$Date,data$Time),
                         "%d/%m/%Y %H:%M:%S")


#creating a png device
png("plot4.png",height=480,width=480,units="px")

# setting parameter for 2x2 plots
par(mfrow=c(2,2))

# plotting
with(data,
     {
       plot(datetime,Global_active_power,type='l',ylab='Global Active Power',xlab="")
       
       plot(datetime,Voltage,type='l')
       
       plot(datetime,Sub_metering_1,type='l',ylab='Energy sub metering',xlab="")
       lines(datetime,Sub_metering_2,col='red')
       lines(datetime,Sub_metering_3,col='blue')
       legend('topright',col=c('black','red','blue'),legend=c('Submetering_1','Submetering_2','Submetering_3'),lwd=1)
       
       plot(datetime,Global_reactive_power,type='l')
     })

#closing png
dev.off()