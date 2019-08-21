library(tidyverse)
library(ggrepel)

basemap = map_data('state')

lat_range = c(20,60)
lon_range = c(-150,50)


original_obs = read_csv('/home/shawn/data/phenology_forecasting/evaluation/phenology_data_2018/individual_phenometrics_data.csv') %>%
  filter(Genus =='Acer', Species == 'rubrum',Phenophase_ID %in% c(371,501)) %>%
  rename(latitude = Latitude, longitude = Longitude, doy=First_Yes_DOY) %>%
  group_by(Site_ID) %>%
  filter(doy == min(doy)) %>%
  ungroup()

#observations = read_csv(paste0(config$data_folder,'evaluation/phenology_2018_observations.csv')) %>%
#  filter(species == 'acer rubrum', Phenophase_ID %in% c(371,501))

doy_to_date = function(x){
 dates = as.Date(paste(2018, x,sep='-'), '%Y-%j')
 abbr  = strftime(dates, '%b')
 return(abbr)
}


ggplot() + 
  geom_polygon(data = basemap, aes(x=long, y = lat, group = group), fill=NA, color='black', size=1.5) +
  geom_jitter(data = original_obs, aes(x=longitude, y=latitude, color=doy), size=5, height=0.2, width = 0.2) + 
  scale_color_viridis_c(label = doy_to_date, breaks=c(1,32,60,91,121,152), limits = c(1,172)) + 
  scale_x_continuous(breaks=seq(lon_range[1],lon_range[2],10), minor_breaks = seq(lon_range[1],lon_range[2],1)) +
  scale_y_continuous(breaks=seq(lat_range[1],lat_range[2],10), minor_breaks = seq(lat_range[1],lat_range[2],1)) + 
  theme_bw() +
  coord_fixed(1.3) +  
  cowplot::theme_nothing() +
  theme(legend.position = 'bottom',
        legend.text = element_text(size=18),
        legend.key.width = unit(3, 'cm'),
        legend.key.size = unit(8, 'mm')) +
  labs(x='Longitude',y='Latitude',color='')

###########################################################
# Map of all NPN sites to illustrate errors.
all_npn_obs = read_csv('/home/shawn/data/phenology_forecasting/evaluation/phenology_data_2018/individual_phenometrics_data.csv') %>%
  rename(latitude = Latitude, longitude = Longitude, doy=First_Yes_DOY) %>%
  filter(latitude > 25, latitude < 50, longitude < -65, longitude > -120) %>%
  group_by(Site_ID) %>%
  filter(doy == min(doy)) %>%
  ungroup()

ggplot() + 
  geom_polygon(data = basemap, aes(x=long, y = lat, group = group), fill=NA, color='black', size=1.5) +
  geom_jitter(data = all_npn_obs, aes(x=longitude, y=latitude),color='#56B4E9', size=4, height=0.2, width = 0.2) + 
  scale_x_continuous(breaks=seq(lon_range[1],lon_range[2],10), minor_breaks = seq(lon_range[1],lon_range[2],1)) +
  scale_y_continuous(breaks=seq(lat_range[1],lat_range[2],10), minor_breaks = seq(lat_range[1],lat_range[2],1)) + 
  theme_bw() +
  coord_fixed(1.3) +  
  cowplot::theme_nothing() +
  theme(legend.position = 'bottom',
        legend.text = element_text(size=18),
        legend.key.width = unit(3, 'cm'),
        legend.key.size = unit(8, 'mm')) +
  labs(x='Longitude',y='Latitude',color='')
############################################################
lter_sites = read_csv('defense_figures/lter_sites.csv')
ggplot() + 
  geom_polygon(data = basemap, aes(x=long, y = lat, group = group), fill=NA, color='black', size=1.5) +
  geom_point(data = lter_sites, aes(x=longitude, y=latitude), size=5, color='maroon') + 
  geom_label_repel(data = lter_sites, aes(x=longitude, y=latitude, label=site_name), size=10, label.size = 1, fill='#c2fcff') + 
  scale_x_continuous(breaks=seq(lon_range[1],lon_range[2],10), minor_breaks = seq(lon_range[1],lon_range[2],1)) +
  scale_y_continuous(breaks=seq(lat_range[1],lat_range[2],10), minor_breaks = seq(lat_range[1],lat_range[2],1)) + 
  theme_bw() +
  coord_fixed(1.3) +  
  cowplot::theme_nothing() +
  theme(legend.position = 'bottom',
        legend.text = element_text(size=18),
        legend.key.width = unit(3, 'cm'),
        legend.key.size = unit(8, 'mm')) +
  labs(x='Longitude',y='Latitude',color='')
