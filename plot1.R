

library(lubridate)
library(dplyr)

PowCon<-read.table("household_power_consumption.txt",sep=";",header=TRUE,dec=".",na.strings="?")
PowCon2 <- PowCon %>%
    mutate(datetime=dmy_hms(paste(Date,Time))) %>%
    filter(year(datetime)==2007) %>%
    filter(month(datetime)==2) %>%
    filter(day(datetime)<3) %>%
    select(-(Date:Time))
    
png(filename = "plot1.png",width=480,height=480)
hist(PowCon2$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()