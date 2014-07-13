# <code r>
# Coursera - Exploratory Data Analysis - Project #1 ===========================
# Individual household electric power consumption - Plot #4 ===================

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

# Plot
png("plot4.png", 480, 480, bg="white")
mylocTime <- Sys.setlocale("LC_TIME")
Sys.setlocale("LC_TIME","English")
par(mfrow=c(2,2))

# A
plot(dat[,2], dat[,3], type="l", xlab=NA, ylab='Global Active Power')

# B
plot(dat[,2], dat[,5], type="l", xlab="datetime", ylab='Voltage')

# C
plot(dat[,2],dat[,7], type = "n", ylab = "Energy sub metering", xlab ="")
lines(dat[,2],dat[,7], col=1)
lines(dat[,2],dat[,8], col=2)
lines(dat[,2],dat[,9], col=4)
legend("topright", legend=names(dat)[7:9], lty=1, col = c(1,2,4), bty="n")

# D
plot(dat[,2], dat[,4], type="l", xlab="datetime",  ylab="Global_reactive_power")

par(mfrow=c(1,1))
Sys.setlocale("LC_TIME", mylocTime)
dev.off()



# </code>
