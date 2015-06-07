plot3 <- function(){
  ##read data from file
  data <- read.table("household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE)
  
  ## convert the date field in the data frame to actual dates
  data[, "Date"] <- as.Date(data[, "Date"], "%d/%m/%Y")
  
  ##subset the data to get Feb data
  febdata <- data[data$Date %in% as.Date(c('2007-2-1', '2007-2-2')),]
  
  ##get the sub metering data
  sub1 <- as.numeric(as.character(febdata[, "Sub_metering_1"]))
  sub2 <- as.numeric(as.character(febdata[, "Sub_metering_2"]))
  sub3 <- as.numeric(as.character(febdata[, "Sub_metering_3"]))
  
  ##get the date and time data, by merging the date and time fields
  datetime <- paste(febdata[,"Date"], febdata[,"Time"])
  
  ##then conmverting them to a proper date time
  dateseries <- strptime(datetime, "%Y-%m-%d %H:%M:%S")
  
  ##open the PNG device
  png(file="plot3.png", bg="white")
  
  ##generate the plot
  plot(dateseries, sub1, type="n", ylab="Energy sub metering", xlab="")
  lines(dateseries, sub1, col="black", type="l")
  lines(dateseries, sub2, col="red", type="l")
  lines(dateseries, sub3, col="blue", type="l")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col=c("black", "red", "blue"), lty=c(1,1,1))
  
  ##close PNG device
  dev.off()
}