# Plot is saved at working directory
# Call examples:
#   1
#       setwd( "..." )  
#       # Filename "household_power_consumption.txt" is used
#       plot2()
#   2
#       setwd( "..." )  
#       plot2( "data.txt" )
#   3
#       plot2( "D:/folder/folder/data.txt" )
plot2<-function(fileName="household_power_consumption.txt")
{
    if( !file.exists(fileName) )
    {
        stop("no file")
    }
    
    library(dplyr)
    
    plotData<-read.table( fileName, header = TRUE, sep=";", row.names=NULL, na.strings="?" ) %>%
        filter( grepl( "^[12]{1}/2/2007$", as.character(Date) ) ) %>%
        mutate( datetime=as.POSIXct( paste( Date, Time ), "%d/%m/%Y %H:%M:%S", tz="GMT" ) )
    
    png(filename="plot2.png", width=480, height=480)
        plot(plotData$datetime, plotData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()
}