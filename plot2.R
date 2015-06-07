plot2 <- function(){
  ##read data from file
  data <- read.table("household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE)
  
  ## convert the date field in the data frame to actual dates
  data[, "Date"] <- as.Date(data[, "Date"], "%d/%m/%Y")
  
  ##subset the data to get Feb data
  febdata <- data[data$Date %in% as.Date(c('2007-2-1', '2007-2-2')),]
  
  ##get the power data
  power <- as.numeric(as.character(febdata[, "Global_active_power"]))
  
  ##get the date and time data, by merging the date and time fields
  datetime <- paste(febdata[,"Date"], febdata[,"Time"])

  ##then conmverting them to a proper date time
  dateseries <- strptime(datetime, "%Y-%m-%d %H:%M:%S")
  
  ##open the PNG device
  png(file="plot2.png", bg="white")
  
  ##generate the plot
  plot(dateseries, power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  
  ##close PNG device
  dev.off()
}