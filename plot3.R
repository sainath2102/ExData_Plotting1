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

# creating a png device
png("plot3.png",height=480,width=480,units="px")

#plotting
with(data,{plot(datetime,Sub_metering_1,type='l',ylab='Energy sub metering',xlab="")
  lines(datetime,Sub_metering_2,col='red')
  lines(datetime,Sub_metering_3,col='blue')
  legend('topright',col=c('black','red','blue'),legend=c('Submetering_1','Submetering_2','Submetering_3'),lwd=1)})

# closing png
dev.off()