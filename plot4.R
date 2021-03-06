
# Load the data to a data frame
householdPowerConsumption = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the data  to have only the required two days
subSetOfHouseholdPowerConsumption = householdPowerConsumption[householdPowerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]

# Prepare the png device 
png(filename ="plot4.png",width = 480, height = 480,bg = "transparent")   

# **** NOTE **** : For white background of a plot, one can use bg = "white" for the png device. Since the plots
# backgrounds of the given project are transparent I chose the transparent background and give the code for both cases.
# Here is  the white background line code that one can use for the png device:
#png(filename ="plot4.png",width = 480, height = 480,bg = "white")  

# Create the x axis data which is the date and time info
datetime= strptime(paste(subSetOfHouseholdPowerConsumption$Date, subSetOfHouseholdPowerConsumption$Time), format = "%d/%m/%Y %H:%M:%S")

# Divide the plot to 4 subplots
par(mfrow=c(2,2))

# Create the plot in the upper left 
plot(datetime,as.numeric(subSetOfHouseholdPowerConsumption$Global_active_power),type="l",xlab="",ylab="Global Active Power")

# Create the plot in the upper right 
plot(datetime,as.numeric(subSetOfHouseholdPowerConsumption$Voltage),type="l",ylab="Voltage")

# Create the plot in the lower left 
plot(datetime,as.numeric(subSetOfHouseholdPowerConsumption$Sub_metering_1),type="l",xlab="",ylab="Energy sub metering")
lines(datetime,as.numeric(subSetOfHouseholdPowerConsumption$Sub_metering_2),col="red")
lines(datetime,as.numeric(subSetOfHouseholdPowerConsumption$Sub_metering_3),col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = 1,col = c("black","red","blue"),bty ="n")

# Create the plot in the lower right 
plot(datetime,as.numeric(subSetOfHouseholdPowerConsumption$Global_reactive_power),type="l",ylab="Global_reactive_power")

# shut down the specified (by default the current) device
dev.off()