# <code r>

# =============================================================================
# Coursera - Exploratory Data Analysis - Project #1
# Data Preparation - Individual household electric power consumption 
# (1 household / 1-min sampling rate / ~ 4 years)
# browseURL("https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption")
# =============================================================================

setwd(choose.dir()); getwd()
dURL <- URLdecode("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

# Verify and Download data (if necessary) - Windows approach ==================
basename(dURL)
if (!file.exists(basename(dURL))) {
          setInternet2(TRUE); setInternet2(NA) 
          download.file(dURL, dest=basename(dURL), mode='wb')
} else message("\nPreviously done!\n")

unzip(basename(dURL), list=TRUE) ### List Zip file content
# 1 household_power_consumption.txt 132960755 2012-10-12 13:38:00

# Data Selection and Reading ==================================================
# Dim: 2075259 rows, 9 columns
# To optimize the reading process we can try restrict the data
zipFile <- unz(basename(dURL), "household_power_consumption.txt")  ### Create a zip connection
showConnections(all=TRUE)
readLines(zipFile, n=400) ### First Look at the data

# The required dates are '2007-02-01' and '2007-02-02'
# First date on file is '16/12/2006' ending on line #397
# Considering 1440 measures by day (1-min rate)...
# [1] 66637 # ..is the first line to select
(as.numeric(as.Date('2007-02-01')-as.Date('17/12/2006', "%d/%m/%Y"))*1440)+397

header     <- readLines(zipFile, n=1); header
headNames  <- scan(textConnection(header), sep=";", what=character()); headNames
dat        <- read.table(zipFile, head=F, sep=";", skip=66637, nrows=2880, 
                         col.names=headNames, na.strings = c("NA", "\\?"))
dat[c(1, nrow(dat)),] # Checking the results (1st and the last lines)

showConnections(all=TRUE)
closeAllConnections(); rm(zipFile)

# Data Transformations ========================================================
dat2 <- transform(dat, 
               Date=as.Date(Date, "%d/%m/%Y"), 
               Time=as.POSIXct(with(dat, paste(as.Date(Date, "%d/%m/%Y"), Time))))
head(dat2)

# Data Export =================================================================
write.table(dat2, file="data2Project1.txt", row.names=FALSE, sep=",")

# </code>
