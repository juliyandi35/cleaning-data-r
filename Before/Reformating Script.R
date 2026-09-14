library(readxl)

# 1. Friday, Jan 4 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "1. Friday, Jan 4 2019", range = "D1:AK44379")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
for (i in 1:length(axles)) {
    summary.frame[i, 1] <- axles[i]
    summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
    summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
    if(i <= 11){
      summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,10:(10+i)]),na.rm = TRUE)
      summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,10:(10+i)]),na.rm = TRUE)
    }else {
      summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,10:(10+i+1)]),na.rm = TRUE)
      summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,10:(10+i+1)]),na.rm = TRUE)
    }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
library(openxlsx)
wb <- createWorkbook()
addWorksheet(wb, sheetName = "Summary Friday, Jan 4 2019")
writeData(wb, sheet = "Summary Friday, Jan 4 2019",summary.frame)

# 2. Friday, Jan 11 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "2. Friday, Jan 11 2019", range = "D1:AH34453")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Jan 11 2019")
writeData(wb, sheet = "Summary Friday, Jan 11 2019",summary.frame)

# 3. Friday, Jan 18 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "3. Friday, Jan 18 2019", range = "D1:AH33803")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 11){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Jan 18 2019")
writeData(wb, sheet = "Summary Friday, Jan 18 2019",summary.frame)

# 4. Friday, Jan 25 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "4. Friday, Jan 25 2019", range = "D1:AH32552")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 10){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+2)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+2)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Jan 25 2019")
writeData(wb, sheet = "Summary Friday, Jan 25 2019",summary.frame)

# 5. Friday, Feb 1 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "5. Friday, Feb 1 2019", range = "D1:AH32541")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Feb 1 2019")
writeData(wb, sheet = "Summary Friday, Feb 1 2019",summary.frame)

# 6. Friday, Feb 15 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "6. Friday, Feb 15 2019", range = "D1:AH34189")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 10){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+2)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+2)]),na.rm = TRUE)
  }
  
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Feb 15 2019")
writeData(wb, sheet = "Summary Friday, Feb 15 2019",summary.frame)

# 7. Friday, Feb 22 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "7. Friday, Feb 22 2019", range = "D1:AH31760")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Feb 22 2019")
writeData(wb, sheet = "Summary Friday, Feb 22 2019",summary.frame)

# 8. Friday, Mar 15 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "8. Friday, Mar 15 2019", range = "D1:AH34084")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Mar 15 2019")
writeData(wb, sheet = "Summary Friday, Mar 15 2019",summary.frame)

# 9. Friday, Mar 22 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "9. Friday, Mar 22 2019", range = "D1:AH32383")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 9){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }
  if (i == 10) {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
  } else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+3)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+3)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Mar 22 2019")
writeData(wb, sheet = "Summary Friday, Mar 22 2019",summary.frame)

# 10. Friday, Mar 29 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "10. Friday, Mar 29 2019", range = "D1:AH34603")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 7){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }
  if (i == 8) {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
  } else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+5)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+5)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Mar 29 2019")
writeData(wb, sheet = "Summary Friday, Mar 29 2019",summary.frame)

# 11. Monday, Apr 1 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "11. Monday, Apr 1 2019", range = "D1:AH30590")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 11){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }
  if (i == 12) {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+3)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+3)]),na.rm = TRUE)
  } else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+7)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+7)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Monday, Apr 1 2019")
writeData(wb, sheet = "Summary Monday, Apr 1 2019",summary.frame)

# 12. Friday, Apr 5 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "12. Friday, Apr 5 2019", range = "D1:AH34270")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 9){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }
  if (i == 10) {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
  } 
  if (i >= 11 && i <=12) {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+3)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+3)]),na.rm = TRUE)
  } 
  if (i == 13) {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+7)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+7)]),na.rm = TRUE)
  }else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+9)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+9)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Apr 5 2019")
writeData(wb, sheet = "Summary Friday, Apr 5 2019",summary.frame)

# 13. Friday, Apr 12 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "13. Friday, Apr 12 2019", range = "D1:AH33755")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 9){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+7)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+7)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Apr 12 2019")
writeData(wb, sheet = "Summary Friday, Apr 12 2019",summary.frame)

# 14. Friday, Apr 26 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "14. Friday, Apr 26 2019", range = "D1:AH38327")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 11){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }
  if (i == 12) {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+2)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+2)]),na.rm = TRUE)
  } else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+5)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+5)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Apr 26 2019")
writeData(wb, sheet = "Summary Friday, Apr 26 2019",summary.frame)

# 15. Friday, May 10 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "15. Friday, May 10 2019", range = "D1:AH28139")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, May 10 2019")
writeData(wb, sheet = "Summary Friday, May 10 2019",summary.frame)

# 16. Friday, May 17 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "16. Friday, May 17 2019", range = "D1:AH28818")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 9){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+5)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+5)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, May 17 2019")
writeData(wb, sheet = "Summary Friday, May 17 2019",summary.frame)

# 17. Friday, Jun 14 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "17. Friday, Jun 14 2019", range = "D1:AH52897")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 11){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }
  if (i >= 12 && i <= 13) {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
  } else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+5)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+5)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Jun 14 2019")
writeData(wb, sheet = "Summary Friday, Jun 14 2019",summary.frame)

# 18. Friday, Jun 21 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "18. Friday, Jun 21 2019", range = "D1:AH40680")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 11){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }
  if (i == 12) {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
  } 
  if (i == 13) {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+3)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+3)]),na.rm = TRUE)
  }
  if (i == 14) {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+5)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+5)]),na.rm = TRUE)
  } else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+8)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+8)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Jun 21 2019")
writeData(wb, sheet = "Summary Friday, Jun 21 2019",summary.frame)

# 19. Friday, Jun 28 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "19. Friday, Jun 28 2019", range = "D1:AH43113")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 11){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }
  if (i == 12) {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
  } else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+3)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+3)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Jun 28 2019")
writeData(wb, sheet = "Summary Friday, Jun 28 2019",summary.frame)

# 20. Friday, Jul 12 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "20. Friday, Jul 12 2019", range = "D1:AH43101")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 9){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }
  if(i >= 10 && i <=11 ){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  } else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+7)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+7)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Jul 12 2019")
writeData(wb, sheet = "Summary Friday, Jul 12 2019",summary.frame)

# 21. Friday, Jul 19 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "21. Friday, Jul 19 2019", range = "D1:AH33245")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Jul 19 2019")
writeData(wb, sheet = "Summary Friday, Jul 19 2019",summary.frame)

# 22. Friday, Jul 26 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "22. Friday, Jul 26 2019", range = "D1:AH33671")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 9){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Jul 26 2019")
writeData(wb, sheet = "Summary Friday, Jul 26 2019",summary.frame)

# 23. Friday, Aug 2 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "23. Friday, Aug 2 2019", range = "D1:AH33959")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 9){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Aug 2 2019")
writeData(wb, sheet = "Summary Friday, Aug 2 2019",summary.frame)

# 24. Friday, Aug 9 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "24. Friday, Aug 9 2019", range = "D1:AH42785")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Aug 9 2019")
writeData(wb, sheet = "Summary Friday, Aug 9 2019",summary.frame)

# 25. Friday, Aug 16 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "25. Friday, Aug 16 2019", range = "D1:AH40860")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 9){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Aug 16 2019")
writeData(wb, sheet = "Summary Friday, Aug 16 2019",summary.frame)

# 26. Friday, Aug 23 2019
data <- read_excel("Format data WIM1 8.1.22.xlsx", sheet = "26. Friday, Aug 23 2019", range = "D1:AH38530")
data <- data.frame(data)
names(data)
summary.frame <- matrix(NA, ncol = 5, nrow = length(table(data$AXLES)))
axles <- names(table(data$AXLES))
axles
for (i in 1:length(axles)) {
  summary.frame[i, 1] <- axles[i]
  summary.frame[i, 4] <- mean(subset(data, AXLES == axles[i])$SPEED)
  summary.frame[i, 5] <- max(subset(data, AXLES == axles[i])$SPEED)
  if(i <= 7){
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i)]),na.rm = TRUE)
  }else {
    summary.frame[i, 2] <- mean(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
    summary.frame[i, 3] <- max(as.matrix(subset(data, AXLES == axles[i])[,7:(7+i+1)]),na.rm = TRUE)
  }
}
colnames(summary.frame) <- c("Jumlah Gandar","Berat Rata-rata", "Berat Maksimal",
                             "Kecepatan Rata-rata", "Kecepatan Maksimal")
addWorksheet(wb, sheetName = "Summary Friday, Aug 23 2019")
writeData(wb, sheet = "Summary Friday, Aug 23 2019",summary.frame)
saveWorkbook(wb, file = "Summary File.xlsx")
