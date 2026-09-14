library(RODBC)
library(openxlsx)

# Folder lokasi file .mdb
folder_path <- "D:/Kerjaan/Project Reformatting Data/Palimanan file 2.1"

# List semua file .mdb
mdb_files <- list.files(folder_path, pattern = "\\.mdb$", full.names = TRUE)

# File Excel untuk output
wb <- createWorkbook()

# Inisialisasi daftar untuk menyimpan semua tabel
all_tables <- list()

# Iterasi melalui setiap file .mdb
for (mdb_file in mdb_files) {
  # Sambungkan ke file .mdb
  conn <- odbcConnectAccess2007(mdb_file)
  
  # Membaca tabel utama
  data <- sqlFetch(conn, "VBV")
  
  # Menjalankan algoritma
  axles <- names(table(data$AXLES))
  summary.frame <- matrix(NA, ncol = 6, nrow = length(axles))
  max_axle <- axles[length(axles)]
  weight_index <- which(colnames(data) == "AX_WT1")
  axle_weights <- data[,weight_index:(weight_index+as.numeric(max_axle)-1)] 
  
  for (i in seq_along(axles)) {
    subset_data <- subset(data, AXLES == axles[i])
    summary.frame[i, 1] <- as.numeric(axles[i])
    summary.frame[i, 4] <- as.numeric(min(subset_data$SPEED, na.rm = TRUE))
    summary.frame[i, 5] <- as.numeric(mean(subset_data$SPEED, na.rm = TRUE))
    summary.frame[i, 6] <- as.numeric(max(subset_data$SPEED, na.rm = TRUE))
    summary.frame[i, 2] <- as.numeric(mean(as.matrix(axle_weights[,1:as.numeric(axles[i])]), na.rm = TRUE))
    summary.frame[i, 3] <- as.numeric(max(as.matrix(axle_weights[,1:as.numeric(axles[i])]), na.rm = TRUE))
  }
  
  # Tambahkan kolom nama
  colnames(summary.frame) <- c("Jumlah Gandar", "Berat Rata-rata", "Berat Maksimal", 
                               "Kecepatan Minimal", "Kecepatan Rata-rata", "Kecepatan Maksimal")
  
  # Simpan ke daftar
  file_name <- tools::file_path_sans_ext(basename(mdb_file))
  addWorksheet(wb, sheetName = file_name)
  writeData(wb, sheet = file_name, summary.frame)
  
  # Tutup koneksi
  odbcClose(conn)
}

# Ekspor semua tabel ke file Excel
saveWorkbook(wb, file = "Summary File Palimanan file 2.1 (2).xlsx")
cat("Tabel telah diekspor ke", "Summary File Palimanan file 2.1 (2).xlsx", "\n")
