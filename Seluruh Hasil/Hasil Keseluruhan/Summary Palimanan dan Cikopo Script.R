# Load libraries
library(readxl)
library(dplyr)
library(writexl)
library(purrr)
library(stringr)

# Set working directory
setwd("D:/Kerjaan/Research Consultant/Project Cleaning Data mas Catur")

# File list dengan nama logis
files <- list(
  Palimanan_1 = "Palimanan file 1/Summary File Palimanan file 1.xlsx",
  Palimanan_2.1 = "Palimanan file 2.1/Summary File Palimanan file 2.1.xlsx",
  Palimanan_2.2 = "Palimanan file 2.2/Summary File Palimanan file 2.2.xlsx",
  Palimanan_2.3 = "Palimanan file 2.3/Summary File Palimanan file 2.3.xlsx",
  Cikopo_1.1 = "Cikopo file 1.1/Summary File Cikopo file 1.1.xlsx",
  Cikopo_1.2 = "Cikopo file 1.2/Summary File Cikopo file 1.2.xlsx",
  Cikopo_1.3 = "Cikopo file 1.3/Summary File Cikopo file 1.3.xlsx"
)

# Fungsi baca semua sheet dari satu file
read_all_sheets <- function(file_path) {
  sheet_names <- excel_sheets(file_path)
  map_dfr(sheet_names, ~ read_excel(file_path, sheet = .x))
}

# Pisahkan file Palimanan dan Cikopo
palimanan_files <- files[str_detect(names(files), "Palimanan")]
cikopo_files <- files[str_detect(names(files), "Cikopo")]

# Fungsi olah data
olah_data <- function(file_list) {
  data <- map_dfr(file_list, ~ read_all_sheets(.x))
  
  cols <- c(
    "Jumlah_Gandar", "Berat_Rata_Rata", "Berat_Minimal", "Berat_Maksimal",
    "Kecepatan_Rata_Rata", "Kecepatan_Minimal", "Kecepatan_Maksimal"
  )
  
  data %>%
    group_by(Jumlah_Gandar) %>%
    summarise(
      Berat_Rata_Rata = mean(Berat_Rata_Rata, na.rm = TRUE),
      Berat_Minimal = min(Berat_Minimal, na.rm = TRUE),
      Berat_Maksimal = max(Berat_Maksimal, na.rm = TRUE),
      Kecepatan_Rata_Rata = mean(Kecepatan_Rata_Rata, na.rm = TRUE),
      Kecepatan_Minimal = min(Kecepatan_Minimal, na.rm = TRUE),
      Kecepatan_Maksimal = max(Kecepatan_Maksimal, na.rm = TRUE),
      .groups = "drop"
    )
}

# Olah dan simpan masing-masing file
ringkasan_palimanan <- olah_data(palimanan_files)
write_xlsx(ringkasan_palimanan, "Ringkasan_Palimanan.xlsx")

ringkasan_cikopo <- olah_data(cikopo_files)
write_xlsx(ringkasan_cikopo, "Ringkasan_Cikopo.xlsx")
