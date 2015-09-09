#Read the data
household.power.data = read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#Change the date format
household.power.data$Date = as.Date(household.power.data$Date, format = "%d/%m/%Y")

#subset the data
household.power.data = household.power.data[household.power.data[,"Date"] == as.Date("2007-02-01", format = "%Y-%m-%d") | household.power.data[,"Date"] == as.Date("2007-02-02", format = "%Y-%m-%d"),]

#plot the graph
png("plot1.png", width=480, height=480)

global.active.power = household.power.data$Global_active_power
hist(global.active.power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

dev.off()
