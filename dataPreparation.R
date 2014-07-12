# <code r>

# =============================================================================
# Coursera - Exploratory Data Analysis - Project #1
# =============================================================================
# Individual household electric power consumption (1 household / 1-min sampling rate / ~ 4 years)
# =============================================================================
# browseURL("https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption")
# =============================================================================

#"C:/LAB/Cursos/Coursera/C4_ExData/Projects"
setwd(choose.dir()); getwd()
dURL <- URLdecode("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")

# Download data =============================================================
# Verify if the file exists. If no, download it.
basename(dURL)
if (!file.exists(basename(dURL))) {
          setInternet2(TRUE); setInternet2(NA) # Windows approach
          download.file(dURL, dest=basename(dURL), mode='wb')
} else message("\nPreviously done!\n")

unzip(basename(dURL), list=TRUE) ### Only list Zip file content
# 1 household_power_consumption.txt 132960755 2012-10-12 13:38:00

# Data Reading ================================================================
# Big data: 2075259 rows, 9 columns
# To prevent memory faults we can try a quick inspection and some calculations
# It's not necessary unzip the file! We can use a zip connection...
zipFile <- unz(basename(dURL), "household_power_consumption.txt")
showConnections(all=TRUE)

# Quick view... ===============================================================
readLines(zipFile, n=400)

# The required dates are '2007-02-01' and '2007-02-02'
# First date on file is '16/12/2006' ending on line #397
# Considering 1440 measures by day (1-min rate)...
(as.numeric(as.Date('2007-02-01')-as.Date('17/12/2006', "%d/%m/%Y"))*1440)+397
# [1] 66637 # ..is the first line to select

header     <- readLines(zipFile, n=1); header
headNames  <- scan(textConnection(header), sep=";", what=character()); headNames
dat        <- read.table(zipFile, head=F, sep=";", skip=66637, nrows=2880, 
                         col.names=headNames, na.strings = c("NA", "\\?"))
dat[c(1, nrow(dat)),] # Checking the 1st and the last lines

write.table(dat, file="datProject1.txt", row.names=FALSE) ### Save if it's all right!

showConnections(all=TRUE)
closeAllConnections(); rm(zipFile)

# </code>
