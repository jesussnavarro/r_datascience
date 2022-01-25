#############################
# Deuda Externa de Venezuela
# Por Ali Jesus Navarro
#############################


#install
install.packages('tidyverse')
install.packages('ggplot2')
install.packages('readxl')
install.packages('gganimate')
install.packages('readxl')
install.packages('hrbrthemes')
install.packages('readr')
install.packages('gifski')
install.packages('av')

# library
library(tidyverse)
library(ggplot2)
library(readxl)
library(gganimate)
library(hrbrthemes)
import_roboto_condensed()

# Cargar y transformar dataframe ----------------------------

deuda_externa <- read_excel("deuda.xlsx", 
                            col_names = FALSE)

df <- deuda_externa
df_t <- t(df)


data <- df_t[-1,]
colnames(data) <- c('Año', 'Deuda_E')
df <- data.frame(data)
data <- df


xValue <- as.numeric(data$Año)
yValue <- as.numeric(data$Deuda_E)
data <- data.frame(xValue,yValue)


# Plot

ggplot(data, aes(x=xValue, y=yValue)) +
  geom_line( color="#69b3a2", size=2, alpha=0.9, linetype=2) +
  theme_ipsum() +
  transition_reveal(xValue) + 
  labs(x='',
       y = 'En Millones de Dolares',
       title = 'Evolucion de la Deuda Externa (Venezuela)',
       subtitle = '         (1997-2018)',
       caption = 'Fuente: Elaboración propia utilizando datos del BCV.')
