#file path
file <-"household_power_consumption.txt"

#read the file
data <- read.table(file,sep=';',header=TRUE, 
                   colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),
                   na.strings='?')

#converting the date variable type and filtering
data <- subset(data,(as.Date(Date,format="%d/%m/%Y") >= as.Date("2007-02-01") & 
                        as.Date(Date,format="%d/%m/%Y") <= as.Date("2007-02-02")))

#creating a png device
png("plot1.png",height=480,width=480,units="px")

#plotting
hist(data$Global_active_power, col='red',
     xlab='Global Active Power (kilowatts)',
     main= 'Global Active Power')

#closing png
dev.off()