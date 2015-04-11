# Plot is saved at working directory
# Call examples:
#   1
#       setwd( "..." )  
#       # Filename "household_power_consumption.txt" is used
#       plot1()
#   2
#       setwd( "..." )  
#       plot1( "data.txt" )
#   3
#       plot1( "D:/folder/folder/data.txt" )
plot1<-function(fileName="household_power_consumption.txt")
{
    if( !file.exists(fileName) )
    {
        stop("no file")
    }
    
    library(dplyr)
    
    plotData<-read.table( fileName, header = TRUE, sep=";", row.names=NULL, na.strings="?" ) %>%
        filter( grepl( "^[12]{1}/2/2007$", as.character(Date) ) )
        
    png(filename="plot1.png", width=480, height=480)
        hist(plotData$Global_active_power, main="Global Active Power", col="red", 
             xlab="Global Active Power (kilowatts)" )    
    dev.off()
}