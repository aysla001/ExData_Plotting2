# summarySCC_PM25.rds contains data frame with PM2.5 emissions for 1999, 2002, 2005, and 2008
# contains number of tons of PM2.5 emitted from a source by year
# fips: A five digit number (string) indicating the US county
# scc: the name of the source as indicated by a digital string (see source code classification table)
# Poullutant: A string indicating the pllutant
# Emissions: Amount of PM2.5 emitted, in tons
# type: The type of source (point, non-point, on-road, or non-road)
# year: the year of emissions recorded
# Source Classification Code TableSource_Classification_Code.rds)

#use function readRDS() function R
# NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

# Question 1: Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all 
# sources for each of the years 1999, 2002, 2005, and 2008.

# Question 2: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

plot2<- function(){
  NEI <- readRDS("summarySCC_PM25.rds")
  #SCC <- readRDS("Source_Classification_Code.rds")
  # sum Emissions column by year
  # NEISumByYear <- tapply(NEI$Emissions, NEI$year, sum) #returns a vector? is that what we want?
  NEIBaltimore <- subset(NEI, NEI$fips == "24510")
  aggdata <-aggregate(as.numeric(NEI$Emissions), by=list(NEI$year), FUN=sum, na.rm=TRUE)
  
  #getOption("scipen") #plot as exponential if it exceeds this number of digits
  #options("scipen" = 1000000)  # was originally 0
  
  plot(aggdata$Group.1, as.numeric(aggdata$x), type="l", ylab="ylab", xlab= "xlab")
  #PROBLEM not ploting my data. Maybe we want to change packages?
}
