# <code r>
# Coursera - Exploratory Data Analysis - Project #1 ===========================
# Individual household electric power consumption - Plot #1 ===================

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
hist(dat[,3], col=2, main='Global Active Power', xlab='Global Active Power (killowatts)')
dev.copy(png, "plot1.png"); dev.off()
# dev.off()

# </code>
