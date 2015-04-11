# Plot is saved at working directory
# Call examples:
#   1
#       setwd( "..." )  
#       # Filename "household_power_consumption.txt" is used
#       plot3()
#   2
#       setwd( "..." )  
#       plot3( "data.txt" )
#   3
#       plot3( "D:/folder/folder/data.txt" )
plot3<-function(fileName="household_power_consumption.txt")
{
    if( !file.exists(fileName) )
    {
        stop("no file")
    }
    
    library(dplyr)
    
    plotData<-read.table( fileName, header = TRUE, sep=";", row.names=NULL, na.strings="?" ) %>%
        filter( grepl( "^[12]{1}/2/2007$", as.character(Date) ) ) %>%
        mutate( datetime=as.POSIXct( paste( Date, Time ), "%d/%m/%Y %H:%M:%S", tz="GMT" ) )
    
    png(filename="plot3.png", width=480, height=480)
        plot(p$datetime, p$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
        lines(p$datetime, p$Sub_metering_1, col="black")
        lines(p$datetime, p$Sub_metering_2, col="red")
        lines(p$datetime, p$Sub_metering_3, col="blue")
        legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            lty=c( 1, 1 ), col=c("black", "red", "blue"))
    dev.off()
}