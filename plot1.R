## Load file into dataset
dataset_electric <- read.table(paste0("./household_power_consumption.txt"),header = T, sep=";",na.strings = "?")
## subset dataset only into desired dates 1/2/2007, 2/2/2007
dataset_electric_subsetted <- subset(dataset_electric, Date=="1/2/2007" | Date=="2/2/2007")
## set parameters of display device to 1 row and 1 column
par(mfrow=c(1,1))
##draw the histogram
## hist(dataset_electric_subsetted$Global_active_power, main="Global Active Power",xlab= "Global Active Power (kilowatts)", col="red")
png(file = "plot1.png",width = 480, height = 480, units = "px") ## Open PNG device; create 'plot1.png' in my working directory
## Create plot and send to a file (no plot appears on screen)
with(dataset_electric_subsetted, hist(Global_active_power, main="Global Active Power",xlab= "Global Active Power (kilowatts)", col="red"))
dev.off() ## Close the PNG file device
## PNG file has been created