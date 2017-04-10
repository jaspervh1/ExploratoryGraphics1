

library(lubridate)
library(dplyr)

PowCon<-read.table("household_power_consumption.txt",sep=";",header=TRUE,dec=".",na.strings="?")
PowCon2 <- PowCon %>%
    mutate(datetime=dmy_hms(paste(Date,Time))) %>%
    filter(year(datetime)==2007) %>%
    filter(month(datetime)==2) %>%
    filter(day(datetime)<3) %>%
    select(-(Date:Time))

png(filename = "plot2.png",width=480,height=480)
with(PowCon2,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()