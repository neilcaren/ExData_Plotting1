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
png(filename = "plot2.png", width=480, height=480)

# Setup par variables
par(mfrow = c(1,1))

# Create Plot
plot(DF$Date, DF$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#close PNG device
dev.off()



