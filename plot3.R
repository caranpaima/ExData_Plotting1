## Load file into dataset
dataset_electric <- read.table(paste0("./household_power_consumption.txt"),header = T, sep=";",na.strings = "?")
## subset dataset only into desired dates 1/2/2007, 2/2/2007
dataset_electric_subsetted <- subset(dataset_electric, Date=="1/2/2007" | Date=="2/2/2007")
## set parameters of display device to 1 row and 1 column
par(mfrow=c(1,1))
## load the lubridate and dplyr libraries to make data manipulation easier
library(lubridate)
library(dplyr)
## create a column with weekdays as a string
data1 <- mutate(dataset_electric_subsetted,Date = as.Date(Date,"%d/%m/%Y"))
data1 <- mutate(data1,Weekday = wday(Date,label=TRUE))
png(file = "plot3.png",width = 480, height = 480, units = "px") ## Open PNG device; create 'plot2.png' in my working directory
## Draw the plot with no text on the X axis labels
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
## Create plot and send to a file (no plot appears on screen)
dev.off() ## Close the PNG file device
## PNG file has been created
