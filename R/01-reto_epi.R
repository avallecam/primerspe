

if(!require("palmerpenguins")) install.packages("palmerpenguins")
library(palmerpenguins)
penguins           # ver el formato: elemento _ característica _ unidad de medida



#' to do
#' (x) reemplazar limpieza por rowwise function
#' (x) ¿reemplazable por base covid? no
#'
#' (x) presentar uso de $ para acceder a vectores dentro de un dataframe
#' (x) extender explicación de retos
#' (x) ¿agregar todo dentro de un primer? incluso retroalimentaciones
#'
#' ( ) traducir contenido de videos como guia a monitores
#' ( ) ¿agregar mapas conceptuales?



library(tidyverse)
ruta <- "https://github.com/reconhub/learn/raw/master/static/data/linelist_20140701.xlsx"
linelist <- rio::import(ruta) %>%
  as_tibble() %>%
  mutate(across(.cols = date_of_infection:date_of_outcome,
                .fns = as.Date,
                format = "%Y-%m-%d"))
#' referencia
#' https://dplyr.tidyverse.org/articles/rowwise.html



# reto 1 ------------------------------------------------------------------


# uso de operador %in% ----------------------------------------------------

#' reto:
#' calcular la tasa de casos fatales
#' fallecidos / total de casos

n_muertes <- sum(linelist$outcome %in% "Death")
n_desenlace_conocido <- sum(linelist$outcome %in% c("Death", "Recover"))
razon_casos_fatales <- n_muertes / n_desenlace_conocido
razon_casos_fatales

# reto 2 ------------------------------------------------------------------


# uso de función which + vect[] -------------------------------------------

#' reto
#' encontrar las filas inconsistentes
#' fecha de inicio de sintomas menor o igual a la fecha de infección reportada

# presentar función which
?which

# usar una prueba lógica (verdadero o falso) para identificar ¿cuáles cumplen?
mistakes <- which(linelist$date_of_onset <= linelist$date_of_infection)

# mostrar localizador de errores
mistakes

# mostrar filas erradas
linelist[mistakes, ]

# retirar filas erradas
linelist[-mistakes, ]

# ¿cómo lo resolverías usando tidyverse?

# usando tidyverse --------------------------------------------------------


#what is happening here?
linelist %>%
  mutate(mistake=date_of_onset-date_of_infection) %>%
  #values 0 or less
  filter(mistake>0)

# extraer inconsistencias
linelist_mist <- linelist %>%
  mutate(mistake=date_of_onset-date_of_infection) %>%
  #values 0 or less
  filter(mistake<=0) %>%
  select(case_id) %>%
  pull()

# mostrar inconsistencias
linelist_mist

# retirar inconsistencias de base original
linelist_clean <- linelist %>%
  filter(!(case_id %in% linelist_mist))

# mostrar filas usando magrittr::is_in()
linelist %>%
  filter(magrittr::is_in(case_id,linelist_mist))

# retirar filas usando magrittr::is_in()
linelist %>%
  filter(!magrittr::is_in(case_id,linelist_mist))


