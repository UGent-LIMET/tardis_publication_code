library(TARDIS)
dbData <-
  createTargetList(
    input_directory_targets = "C:/Users/pvgeende/OneDrive - UGent/Documents/publications/tardis_paper/data/scale_analysis/targets_adjusted_pos.xlsx",
    pos_pattern = "+",
    neg_pattern = "-",
    polarity = "positive",
    ion_column = "ion",
    columns_of_interest = c("id", "name", "mz", "rt")
  )

dbData <- dbData[c(89,115:213),]

start <- Sys.time()
res <- tardis_peaks("C:/Users/pvgeende/OneDrive - UGent/Documents/publications/tardis_paper/data/scale_analysis/files50/",
  dbData = dbData,
  ppm = 5,
  rtdev = 18,
  mode = "metabolomics",
  mass_range = NULL,
  polarity = "positive",
  output_directory = "C:/Users/pvgeende/OneDrive - UGent/Desktop/files_finhit/",
  plots_samples = FALSE,
  plots_QC = FALSE,
  diagnostic_plots = FALSE,
  batch_mode = TRUE,
  batch_positions = list(c(1, 50)),
  QC_pattern = "QC",
  sample_pattern = "",
  rt_alignment = TRUE,
  int_std_id = c("331", "1576","1577","1578","1583"),
  screening_mode = FALSE,
  smoothing = TRUE,
  max_int_filter = 0
)
stop <- Sys.time()
diff <- stop - start
diff_50_2 <- diff

start <- Sys.time()
res <- tardis_peaks("C:/Users/pvgeende/OneDrive - UGent/Documents/publications/tardis_paper/data/scale_analysis/files100/",
                    dbData = dbData,
                    ppm = 5,
                    rtdev = 18,
                    mode = "metabolomics",
                    mass_range = NULL,
                    polarity = "positive",
                    output_directory = "C:/Users/pvgeende/OneDrive - UGent/Desktop/files_finhit/",
                    plots_samples = FALSE,
                    plots_QC = FALSE,
                    diagnostic_plots = FALSE,
                    batch_mode = TRUE,
                    batch_positions = list(c(1, 100)),
                    QC_pattern = "QC",
                    sample_pattern = "",
                    rt_alignment = TRUE,
                    int_std_id = c("331", "1576","1577","1578","1583"),
                    screening_mode = FALSE,
                    smoothing = TRUE,
                    max_int_filter = 0
)
stop <- Sys.time()
diff <- stop - start
diff_100_2 <- diff

start <- Sys.time()
res <- tardis_peaks("C:/Users/pvgeende/OneDrive - UGent/Documents/publications/tardis_paper/data/scale_analysis/files200/",
                    dbData = dbData,
                    ppm = 5,
                    rtdev = 18,
                    mode = "metabolomics",
                    mass_range = NULL,
                    polarity = "positive",
                    output_directory = "C:/Users/pvgeende/OneDrive - UGent/Desktop/files_finhit/",
                    plots_samples = FALSE,
                    plots_QC = FALSE,
                    diagnostic_plots = FALSE,
                    batch_mode = TRUE,
                    batch_positions = list(c(1, 200)),
                    QC_pattern = "QC",
                    sample_pattern = "",
                    rt_alignment = TRUE,
                    int_std_id = c("331", "1576","1577","1578","1583"),
                    screening_mode = FALSE,
                    smoothing = TRUE,
                    max_int_filter = 0
)
stop <- Sys.time()
diff <- stop - start
diff_200_2 <- diff

start <- Sys.time()
res <- tardis_peaks("C:/Users/pvgeende/OneDrive - UGent/Documents/publications/tardis_paper/data/scale_analysis/files400/",
                    dbData = dbData,
                    ppm = 5,
                    rtdev = 18,
                    mode = "metabolomics",
                    mass_range = NULL,
                    polarity = "positive",
                    output_directory = "C:/Users/pvgeende/OneDrive - UGent/Desktop/files_finhit/",
                    plots_samples = FALSE,
                    plots_QC = FALSE,
                    diagnostic_plots = FALSE,
                    batch_mode = TRUE,
                    batch_positions = list(c(1, 400)),
                    QC_pattern = "QC",
                    sample_pattern = "",
                    rt_alignment = TRUE,
                    int_std_id = c("331", "1576","1577","1578","1583"),
                    screening_mode = FALSE,
                    smoothing = TRUE,
                    max_int_filter = 0
)
stop <- Sys.time()
diff <- stop - start
diff_400_2 <- diff

start <- Sys.time()
res <- tardis_peaks("C:/Users/pvgeende/OneDrive - UGent/Documents/publications/tardis_paper/data/scale_analysis/files700/",
                    dbData = dbData,
                    ppm = 5,
                    rtdev = 18,
                    mode = "metabolomics",
                    mass_range = NULL,
                    polarity = "positive",
                    output_directory = "C:/Users/pvgeende/OneDrive - UGent/Desktop/files_finhit/",
                    plots_samples = FALSE,
                    plots_QC = FALSE,
                    diagnostic_plots = FALSE,
                    batch_mode = TRUE,
                    batch_positions = list(c(1, 700)),
                    QC_pattern = "QC",
                    sample_pattern = "",
                    rt_alignment = TRUE,
                    int_std_id = c("331", "1576","1577","1578","1583"),
                    screening_mode = FALSE,
                    smoothing = TRUE,
                    max_int_filter = 0
)
stop <- Sys.time()
diff <- stop - start
diff_700_2 <- diff






library(ggplot2)
library(magrittr)
library(hrbrthemes)
data <- data.frame(samples = as.numeric(c(50,100,200,400,700,50,100,200,400,700)),
                   time = as.numeric(c(diff_50,diff_100,diff_200,diff_400,diff_700,diff_50_2,diff_100_2,diff_200_2,diff_400_2,diff_700_2)/60),
                   group = c("215","215","215","215","215","100","100","100","100","100"))
data %>%
  ggplot( aes(x=samples, y=time, color = group,shape = group)) +
  geom_point(size = 3) +
  scale_x_continuous(breaks = c(0,50,100,200,400,700)) +
  theme_ipsum(base_family = "Aptos", base_size = 7) +
  scale_color_brewer(palette = "Paired",type = "div") +
  labs(x = "Number of runs",y = "Time (min)",color = "Number of targets", shape = "Number of targets") +
  theme(axis.title.x = element_text(size = 7),axis.title.y = element_text(size = 7)) +
  theme(plot.margin=grid::unit(c(0,0,0,0), "mm")) +
  theme(legend.position = "none")

ggsave("scaling.png",dpi = 300,width = 8.4,
       height = 6,
       units = "cm",
       bg = "white")
