# ----- Load libraries ----- #
library(sf)               # Load boundaries shapefile (.shp)
library(ggplot2)          # Create the graph
library(readxl)           # Read the data from Excel
library(dplyr)            # Combine the data from shp and Excel 
library(MetBrewer)        # Palette of colors
library(patchwork)        # Allows multiple plots in the same canvas 

# ----- This section loads the shp of the Provinces of Ecuador ----- # 
bpe <- st_read("Administrative Division Provincias/nxprovincias.shp")
  # Boundaries Provinces Ecuador

bpce <- bpe[-c(25,20), (2:3)] 
  # Boundaries Provinces Continental Ecuador
  # Only need the DPA_DESPRO column and Galapagos is not included


# ----- This section loads the normalize data from Excel  ----- # 
len <- read_excel("Lenguas por provincias.xlsx", sheet = "normalizedTable")
  # lenguages normalized 


# ----- This section merge the two data frames (df) ----- # 
colnames(bpce)[2] <- "Provincias"
colnames(len)[1] <- "Provincias"
  # Set the colnames of both df to "Provincias" to merge

bpce$Provincias = len$Provincias
  # Names in shp are in capital letters, make the equal to the names in len to merge

df <- merge(bpce, len, by = "Provincias")
  # Merge both df to merge the geometry column and the data


# ----- Thi section plot the map ----- # 
leng1 <- ggplot(data=df)+
  geom_sf(aes(fill=AIngae), color="white")+
    # Fill the object in the map with the column "AIngae"
    # The same process is repetead in the others graphs just changing the column
  theme_void()+
    # A completely empty theme
  theme(legend.position = "left")+
  scale_fill_met_c("Lakota" , direction = 1)
    # Colors the map with the palette "Lakota" from MetBrewer

leng2 <- ggplot(data=df)+
  geom_sf(aes(fill=AchuarChic), color="white")+
  theme_void()+
  theme(legend.position = "left")+
  scale_fill_met_c("Lakota" , direction = 1)

leng3 <- ggplot(data=df)+
  geom_sf(aes(fill=Andoa), color="white")+
  theme_void()+
  theme(legend.position = "left")+
  scale_fill_met_c("Lakota" , direction = 1)

leng4 <- ggplot(data=df)+
  geom_sf(aes(fill=Awapít), color="white")+
  theme_void()+
  theme(legend.position = "left")+
  scale_fill_met_c("Lakota" , direction = 1)

leng5 <- ggplot(data=df)+
  geom_sf(aes(fill=ChaPalaa), color="white")+
  theme_void()+
  theme(legend.position = "left")+
  scale_fill_met_c("Lakota" , direction = 1)

leng6 <- ggplot(data=df)+
  geom_sf(aes(fill=Kichwa), color="white")+
  theme_void()+
  theme(legend.position = "left")+
  scale_fill_met_c("Lakota" , direction = 1)

leng7 <- ggplot(data=df)+
  geom_sf(aes(fill=Paicoca), color="white")+
  theme_void()+
  theme(legend.position = "left")+
  scale_fill_met_c("Lakota" , direction = 1)

leng8 <- ggplot(data=df)+
  geom_sf(aes(fill=ShiwiarChi), color="white")+
  theme_void()+
  theme(legend.position = "left")+
  scale_fill_met_c("Lakota" , direction = 1)

leng9 <- ggplot(data=df)+
  geom_sf(aes(fill=ShuarChich), color="white")+
  theme_void()+
  theme(legend.position = "left")+
  scale_fill_met_c("Lakota" , direction = 1)

leng10 <- ggplot(data=df)+
  geom_sf(aes(fill=TsaFiqui), color="white")+
  theme_void()+
  theme(legend.position = "left")+
  scale_fill_met_c("Lakota" , direction = 1)

leng11 <- ggplot(data=df)+
  geom_sf(aes(fill=Waotededo), color="white")+
  theme_void()+
  theme(legend.position = "left")+
  scale_fill_met_c("Lakota" , direction = 1)

leng12 <- ggplot(data=df)+
  geom_sf(aes(fill=Zapara), color="white")+
  theme_void()+
  theme(legend.position = "left")+
  scale_fill_met_c("Lakota" , direction = 1)

leng13 <- ggplot(data=df)+
  geom_sf(aes(fill=ZiaPedee), color="white")+
  theme_void()+
  theme(legend.position = "left")+
  scale_fill_met_c("Lakota" , direction = 1)

leng1+leng2+leng3+leng4+leng5+leng6+leng7+leng8+leng9+leng10+leng11+leng12+leng13

ggsave("Regions.png", width = 27, height = 29, units = "cm", dpi = 300)
  # Save the plot in the current wd()


