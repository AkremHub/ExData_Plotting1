
# Load the data to a data frame
householdPowerConsumption = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the data  to have only the required two days
subSetOfHouseholdPowerConsumption = householdPowerConsumption[householdPowerConsumption$Date %in% c("1/2/2007","2/2/2007") ,]

# Prepare the png device 
png(filename ="plot1.png",width = 480, height = 480,bg = "transparent")  

# **** NOTE **** : For white background of a plot, one can use bg = "white" for the png device. Since the plots
# backgrounds of the given project are transparent I chose the transparent background and give the code for both cases.
# Here is  the white background line code that one can use for the png device:
#png(filename ="plot1.png",width = 480, height = 480,bg = "white")  

# Create the plot
hist(as.numeric(subSetOfHouseholdPowerConsumption$Global_active_power),xlab="Global Active Power (Kilowatts)",breaks=12,main = "Global Active Power",col="red")

# shut down the specified (by default the current) device
dev.off()