#Read the data
household.power.data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#Change the date format
household.power.data$Date = as.Date(household.power.data$Date, format = "%d/%m/%Y")

#subset the data
household.power.data = household.power.data[household.power.data[,"Date"] == as.Date("2007-02-01", format = "%Y-%m-%d") | household.power.data[,"Date"] == as.Date("2007-02-02", format = "%Y-%m-%d"),]

#create date time variable
dateTime = paste(as.Date(household.power.data$Date),household.power.data$Time)
household.power.data$dateTime <- as.POSIXct(dateTime)

#plot the graph
png("plot2.png", width=480, height=480)

plot(household.power.data$Global_active_power~household.power.data$dateTime,ylab = "Global Active Power (kilowatts)", xlab = "", type = "l")

dev.off()
