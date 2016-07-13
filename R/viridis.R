library(viridis)
library(dplyr)
library(tidyr)
library(colorspace)
library(ggplot2)
library(magrittr)

m <- viridis(16) %>%
  col2rgb() %>%
  t %>%
  convertColor(from="sRGB", to="sRGB", scale.in=255) %>%
  RGB %>%
  as("polarLUV") %>%
  coords

prcomp(m)

m %>%
  polarLUV %>%
  as("RGB") %>%
  coords %>%
  inset(. < 0, 0) %>%
  inset(. > 1, 1) %>%
  rgb() %>%
  scales::show_col(labels = F)

