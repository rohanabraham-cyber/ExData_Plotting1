library("data.table")

setwd("~/Desktop/datasciencecoursera/4_Exploratory_Data_Analysis/project/data")


pwrET<-data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)


pwrET[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]


pwrET[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]


pwrET<-pwrET[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]

png("plot2.png", width=480, height=480)


plot(x =pwrET[, dateTime]
     , y = pwrET[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()