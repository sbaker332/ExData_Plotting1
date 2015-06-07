plot1 <- function(){
  ##read data from file
  data <- read.table("household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE)
  
  ## convert the date field in the data frame to actual dates
  data[, "Date"] <- as.Date(data[, "Date"], "%d/%m/%Y")
  
  ##subset the data to get Feb data
  febdata <- data[data$Date %in% as.Date(c('2007-2-1', '2007-2-2')),]
  
  ##get the power data for the histogram
  power <- as.numeric(as.character(febdata[, "Global_active_power"]))
  
  ##open the PNG device
  png(file="plot.png", bg="transparent")
  
  ##generate the histogram with title and labels
  hist(power, col="red", xlab="Global Active Power (kilowatts)", 
       main="Global Active Power")
  
  ##close PNG device
  dev.off()
}