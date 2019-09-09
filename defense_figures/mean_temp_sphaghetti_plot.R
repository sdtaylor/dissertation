library(tidyverse)



tmean = read_csv('defense_figures/tmean_data_20190905.csv')

date_range = as.Date(c('2019-08-01','2019-12-31'))

observed_line = tmean %>%
  group_by(time) %>%
  summarise(tmean = mean(tmean)) %>%
  ungroup() %>%
  filter(time <= as.Date('2019-09-04'))

ggplot(tmean, aes(x=time, y=tmean, color=as.factor(initial_time))) +
  geom_line(size=2) +
  geom_line(data = observed_line, color='black', size=2) + 
  scale_color_brewer(palette = 'Dark2') +
  geom_vline(xintercept = as.Date('2019-09-04'), size=2, linetype='dotted') + 
  scale_x_date(limits = as.Date(c('2019-08-01','2019-12-31'))) +
  theme_bw(18) + 
  theme(legend.position = 'bottom') + 
  labs(x='', y='Daily Mean Temperature (C)', color='Initial Time')
