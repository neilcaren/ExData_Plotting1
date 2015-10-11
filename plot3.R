# Note - The file "household_power_consumption.txt" must be present in current working directiry.  
# The file is available here ---> https://github.com/neilcaren/ExData_Plotting1.git

# Read data from file in to data frame
DF <- read.table("household_power_consumption.txt",sep=";",header=TRUE,comment.char = " ", stringsAsFactors = FALSE, na.strings="?")

# Keep only dates that are needed
DF <- subset(DF, DF$Date == "1/2/2007" | DF$Date == "2/2/2007")

# Format Date to include Time.  Reformat to POSIXlt format making plots easier to create
DF$Date <- paste(DF$Date, DF$Time, sep= " ")
DF$Date <- strptime(DF$Date,"%d/%m/%Y %H:%M:%S")

#open PNG device
png(filename = "plot3.png", width=480, height=480)

# Setup par variables
par(mfrow = c(1,1))

# Create Plot

plot(DF$Date, DF$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(x=DF$Date, y = DF$Sub_metering_1, type = "l", col="black")
points(x=DF$Date, y = DF$Sub_metering_2, type = "l", col="red")
points(x=DF$Date, y = DF$Sub_metering_3, type = "l", col="blue")

legend( x="topright", 
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        col=c("black","red","blue"), lwd=1, lty=c(1,1,1))

#close PNG device
dev.off()

