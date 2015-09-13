
# Load the data to a data frame
householdPowerConsumption = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the data  to have only the required two days
subSetOfHouseholdPowerConsumption = householdPowerConsumption[householdPowerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]

# Prepare the png device 
png(filename ="plot2.png",width = 480, height = 480)

# **** NOTE **** : For transparent background of a plot, one can use bg = "transparent" for the png device. Since the plots
# backgrounds are not specified  in the project  quetsion  I chose the white background (the default) and give the code for both cases.
# Here is  the transparent background line code that one can use for the png device:
# png(filename ="plot2.png",width = 480, height = 480,bg = "transparent")    

# Create the x axis data which is the date and time info
datetime= strptime(paste(subSetOfHouseholdPowerConsumption$Date, subSetOfHouseholdPowerConsumption$Time), format = "%d/%m/%Y %H:%M:%S")

# Create the plot  
plot(datetime,as.numeric(subSetOfHouseholdPowerConsumption$Global_active_power),type="l",xlab="",ylab="Global Active Power (Kilowatts)")

# shut down the specified (by default the current) device
dev.off()