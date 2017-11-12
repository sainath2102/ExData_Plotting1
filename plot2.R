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
png("plot2.png",height=480,width=480,units="px")

#plotting
plot(data$datetime,data$Global_active_power,ylab="Global Active Power (kilowatts)",pch=NA,xlab="")
lines(data$datetime, data$Global_active_power)

#closing png
dev.off()