
library(lubridate)
library(dplyr)

PowCon<-read.table("household_power_consumption.txt",sep=";",header=TRUE,dec=".",na.strings="?")
PowCon2 <- PowCon %>%
    mutate(datetime=dmy_hms(paste(Date,Time))) %>%
    filter(year(datetime)==2007) %>%
    filter(month(datetime)==2) %>%
    filter(day(datetime)<3) %>%
    select(-(Date:Time))

png(filename = "plot3.png",width=480,height=480)
with(PowCon2,plot(datetime,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering"))
with(PowCon2,lines(datetime,Sub_metering_2,col="red"))
with(PowCon2,lines(datetime,Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.off()