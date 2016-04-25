## Load file into dataset
dataset_electric <- read.table(paste0("./household_power_consumption.txt"),header = T, sep=";",na.strings = "?")
## subset dataset only into desired dates 1/2/2007, 2/2/2007
dataset_electric_subsetted <- subset(dataset_electric, Date=="1/2/2007" | Date=="2/2/2007")

## load the lubridate and dplyr libraries to make data manipulation easier
library(lubridate)
library(dplyr)
## create a column with weekdays as a string
data1 <- mutate(dataset_electric_subsetted,Date = as.Date(Date,"%d/%m/%Y"))
data1 <- mutate(data1,Weekday = wday(Date,label=TRUE))
png(file = "plot4.png",width = 480, height = 480, units = "px") ## Open PNG device; create 'plot2.png' in my working directory

## set parameters of display device to 2 rows and 2 columns
par(mfcol=c(2,2))

## Draw the first plot with no text on the X axis labels
with(data1,plot(Global_active_power, type="l", xaxt="n", xlab= "Weekday", ylab = "Global Active Power"))
# Add text for the X axis labels
axis(1,at=c(0,1500,2900),labels = c("Thursdays","Fridays","Saturdays"))

## Draw the second plot
## Create first data series
with(data2,plot(Sub_metering_1, type="l", xaxt="n", ylim=range(data2$Sub_metering_1), xlab="",ylab=""))
## Avoid redrawing of the entire plot
par(new=T)
## Create second data series
with(data1,plot(Sub_metering_2, type="l", xaxt="n", col="red", ylim=range(data2$Sub_metering_1),xlab="",ylab=""))
## Avoid redrawing of the entire plot
par(new=T)
## Create third data series
with(data1,plot(Sub_metering_3, type="l", xaxt="n", col="blue",ylim=range(data2$Sub_metering_1), xlab="", ylab="Energy Sub-metering"))
# Add text for the X axis labels
axis(1,at=c(0,1500,2900),labels = c("Thursdays","Fridays","Saturdays"))
## add the legend
legend("topright", pch="-",col=c("black","red","blue"), legend = c("SubMet1","SubMet2","SubMet3"))
## Avoid redrawing of the entire plot


## Draw the third plot with no text on the X axis labels
with(data1,plot(Voltage, type="l", xaxt="n", xlab= "datetime", ylab = "Voltage"))
# Add text for the X axis labels
axis(1,at=c(0,1500,2900),labels = c("Thursdays","Fridays","Saturdays"))

## Draw the fourth plot with no text on the X axis labels

# Add text for the X axis labels
with(data1,plot(Global_reactive_power, type="l", xaxt="n", xlab= "datetime", ylab = "Global Reactive Power"))
# Add text for the X axis labels
axis(1,at=c(0,1500,2900),labels = c("Thursdays","Fridays","Saturdays"))

## set parameters of display device back to 1 rows and 1 columns
#par(mfcol=c(1,1))
## Create plot and send to a file (no plot appears on screen)
dev.off() ## Close the PNG file device
## PNG file has been created