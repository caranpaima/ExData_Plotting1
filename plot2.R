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
png(file = "plot2.png",width = 480, height = 480, units = "px") ## Open PNG device; create 'plot2.png' in my working directory
## Draw the plot with no text on the X axis labels
with(data1,plot(Global_active_power, type="l", xaxt="n", xlab= "Weekday", ylab = "Global Active Power"))
# Add text for the X axis labels
axis(1,at=c(0,1500,2900),labels = c("Thursdays","Fridays","Saturdays"))
## Create plot and send to a file (no plot appears on screen)
dev.off() ## Close the PNG file device
## PNG file has been created
