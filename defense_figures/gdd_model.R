library(tidyverse)
library(patchwork)

set.seed(15)
days = 1:20
temps = rnorm(length(days), mean = 4, sd=5)
temps[7] = -3
forcing = ifelse(temps>0, temps, 0)
gdd = cumsum(forcing)
df = tibble(day = days,
            temp = temps, 
            gdd = gdd)

# Temperature plot
temp_plot = ggplot(df, aes(x=day, y=temp)) + 
  geom_point(size=3) +
  geom_line(size=2) +
  geom_hline(yintercept = 0, linetype='dashed', size=2) + 
  ylim(-6, 15) +
  theme_bw(20) +
  labs(x='',y='C°',subtitle = 'Temperature')

gdd_plot = ggplot(df, aes(x=day, y=gdd)) + 
  geom_line(color='red', size=1) +
  geom_hline(yintercept = 75, linetype='dashed', color='#009E73', size=1.5) + 
  theme_bw(20)+
  labs(x='Days',y='', subtitle = 'Accumulated Growing Degree Days') 

 temp_plot + gdd_plot +
  patchwork::plot_layout(ncol=1)

 