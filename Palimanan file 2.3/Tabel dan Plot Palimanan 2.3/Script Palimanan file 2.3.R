# Load library
library(RODBC)
library(openxlsx)
library(ggplot2)
library(dplyr)
library(tidyr)

# Folder lokasi file .mdb
setwd("D:/Kerjaan/Research Consultant/Project Cleaning Data mas Catur/Palimanan file 2.3")
folder_path <- "D:/Kerjaan/Research Consultant/Project Cleaning Data mas Catur/Palimanan file 2.3"

# List semua file .mdb
mdb_files <- list.files(folder_path, pattern = "\\.mdb$", full.names = TRUE)

# File Excel untuk output
wb <- createWorkbook()

# Iterasi tiap file
for (mdb_file in mdb_files) {
  # Koneksi ke MDB
  conn <- odbcConnectAccess2007(mdb_file)
  data <- sqlFetch(conn, "VBV")
  
  # Buat list kosong untuk simpan hasil sementara
  result_list <- list()
  
  # Dapatkan jumlah gandar unik dan urutkan
  unique_axles <- sort(unique(data$AXLES))
  
  # Loop untuk setiap jumlah gandar
  for (n_axles in unique_axles) {
    # Filter data untuk jumlah gandar tertentu
    df_filtered <- data %>% filter(AXLES == n_axles)
    
    # Ambil kolom berat sesuai jumlah gandar (AX_WT1 hingga AX_WTn)
    ax_wt_cols <- paste0("AX_WT", 1:n_axles)
    
    # Hitung berat rata-rata per baris, lalu ambil mean dari seluruh baris
    avg_weight <- df_filtered %>%
      dplyr::select(all_of(ax_wt_cols)) %>%
      rowMeans(na.rm = TRUE) %>%
      mean(na.rm = TRUE)
    
    min_weight <- df_filtered %>%
      dplyr::select(all_of(ax_wt_cols)) %>%
      apply(1, min, na.rm = TRUE) %>%
      min(na.rm = TRUE)
    
    max_weight <- df_filtered %>%
      dplyr::select(all_of(ax_wt_cols)) %>%
      apply(1, max, na.rm = TRUE) %>%
      max(na.rm = TRUE)
    
    # Kecepatan
    avg_speed <- mean(df_filtered$SPEED, na.rm = TRUE)
    min_speed <- min(df_filtered$SPEED, na.rm = TRUE)
    max_speed <- max(df_filtered$SPEED, na.rm = TRUE)
    
    # Simpan ke list
    result_list[[as.character(n_axles)]] <- data.frame(
      Jumlah_Gandar = n_axles,
      Berat_Rata_Rata = avg_weight,
      Berat_Minimal = min_weight,
      Berat_Maksimal = max_weight,
      Kecepatan_Rata_Rata = avg_speed,
      Kecepatan_Minimal = min_speed,
      Kecepatan_Maksimal = max_speed
    )
  }
  
  # Gabungkan semua hasil menjadi satu data frame
  tabel_ringkasan <- do.call(rbind, result_list)
  
  # Simpan ke Excel
  file_name <- tools::file_path_sans_ext(basename(mdb_file))
  addWorksheet(wb, sheetName = file_name)
  writeData(wb, sheet = file_name, tabel_ringkasan)
  
  labels = c("Berat_Rata_Rata" = "Rata-Rata", "Berat_Minimal" = "Minimal", "Berat_Maksimal" = "Maksimal")
  # Reshape data untuk plotting berat
  berat_long <- tabel_ringkasan %>%
    dplyr::select(Jumlah_Gandar, Berat_Rata_Rata, Berat_Minimal, Berat_Maksimal) %>%
    pivot_longer(cols = -Jumlah_Gandar, names_to = "Tipe", values_to = "Berat")
  
  # Plot berat dengan legend
  berat_plot <- ggplot(berat_long, aes(x = factor(Jumlah_Gandar), y = Berat, fill = Tipe)) +
    geom_col(position = position_dodge(width = 0.6), width = 0.5) +
    labs(title = paste("Berat Gandar (Axles)", file_name),
         x = "Jumlah Gandar Kendaraan", y = "Berat Gandar (kg)", fill = "Tipe Berat") +
    scale_fill_manual(values = c("Berat_Rata_Rata" = "steelblue",
                                 "Berat_Minimal" = "seagreen",
                                 "Berat_Maksimal" = "indianred"),labels = labels) +
    theme_light()
  
  # Simpan plot berat
  ggsave(filename = paste0("Berat_Gandar_", file_name, ".png"), plot = berat_plot, width = 8, height = 5)
  
  # Reshape data untuk plotting kecepatan
  kecepatan_long <- tabel_ringkasan %>%
    dplyr::select(Jumlah_Gandar, Kecepatan_Rata_Rata, Kecepatan_Minimal, Kecepatan_Maksimal) %>%
    pivot_longer(cols = -Jumlah_Gandar, names_to = "Tipe", values_to = "Kecepatan")
  
  # Plot kecepatan dengan legend
  kecepatan_plot <- ggplot(kecepatan_long, aes(x = factor(Jumlah_Gandar), y = Kecepatan, fill = Tipe)) +
    geom_col(position = position_dodge(width = 0.6), width = 0.5) +
    labs(title = paste("Kecepatan (Axles)", file_name),
         x = "Jumlah Gandar Kendaraan", y = "Kecepatan (km/jam)", fill = "Tipe Kecepatan") +
    scale_fill_manual(values = c("Kecepatan_Rata_Rata" = "steelblue",
                                 "Kecepatan_Minimal" = "seagreen",
                                 "Kecepatan_Maksimal" = "indianred"),labels = labels) +
    theme_light()
  
  # Simpan plot kecepatan
  ggsave(filename = paste0("Kecepatan_", file_name, ".png"), plot = kecepatan_plot, width = 8, height = 5)
  
  # Tutup koneksi
  odbcClose(conn)
}

# Simpan workbook
saveWorkbook(wb, file = "Summary File Palimanan file 2.3.xlsx", overwrite = TRUE)
cat("Selesai! File dan grafik telah diekspor.\n")
