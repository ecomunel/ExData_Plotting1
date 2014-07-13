# <code r>
# Coursera - Exploratory Data Analysis - Project #1 ===========================
# Individual household electric power consumption - Plot #2 ===================

setwd(choose.dir()); getwd()
dName <- "data2Project1.txt"
dURL  <- "https://raw.githubusercontent.com/ecomunel/ExData_Plotting1/master/data2Project1.txt"

# Verify and Download data (if necessary) - Windows approach ==================
# You could use dataPreparation.R to obtain the data file!
if (!file.exists(dName)) {
          setInternet2(TRUE); setInternet2(NA) 
          download.file(dURL, dest=basename(dURL), mode='wb')
} else message("\nThe file already exists!\n")

# Data Reading ================================================================
dat <- read.table(dName, header=TRUE, sep=",", , na.strings = c("NA", "?"))
dat <- transform(dat, Date=as.Date(Date), Time=as.POSIXct(Time)); head(dat)

# Plot ========================================================================
windows(480, 480, bg="white")
mylocTime <- Sys.setlocale("LC_TIME")
Sys.setlocale("LC_TIME","English")

plot(dat[,2], dat[,3], type="l", xlab=NA, ylab='Global Active Power (killowatts)')

Sys.setlocale("LC_TIME", mylocTime)
dev.copy(png, "plot2.png"); dev.off()
# dev.off()

# </code>
