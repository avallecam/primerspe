#--------------#
# LISTAS
#--------------#


# Crear listas ------------------------------------------------------------
#  Si no sabes como crear una lista en R, solo necesitas usar la funcion list, 
#  especificando los objetos que deseas unir dentro de tu lista.
#  Por ejemplo


x <- c(45, 12, 56, 14, 16)
y <- c("Coche", "Bicicleta")
z <- matrix(1:12, ncol = 4)

# Creando una lista
mi_lista <- list(x, y, z)
mi_lista


# Nombrar elementos de listas ---------------------------------------------
#  Como en otras estructuras de datos de R, puedes nombrar los elementos para 
#  identificar o tener un acceso mas facil a los objetos utilizando el signo $.

mi_lista_nombres <- list(A = x, B = y, C = z)

mi_lista_nombres$A
mi_lista_nombres$B


# Extraer elementos de lista ----------------------------------------------
#  Ahora, vamos a indexar los elementos de la lista para acceder a los datos que queramos. 
#  Para ello, puedes extraer los elementos de la lista con corchetes simples o dobles.

# Primer elemento de la lista
mi_lista[1]

# Y si probamos 
mi_lista[[1]]  # Que diferencias observas?
 
# Simplificando la salida
mi_lista[[1]]



# Primer elemento del primer elemento de la lista.
mi_lista[[1]][1]
unlist(mi_lista[1])[1] # Equivalente

# Primera columna del tercer elemento
mi_lista[[3]][, 1]

# Segundo elemento de la primera columna
# del tercer elemento de la lista
mi_lista[[3]][, 1][2]
mi_lista[[3]][2, 1] # Equivalente

#   Sin embargo, en caso de que hayas nombrado los elementos de tu lista, puedes
#   usar la forma anterior para obtener los valores, especificar los nombres de 
#   los elementos de la lista a los que deseas acceder, o usar el operador $, 
#   tal y como se muestra en los siguientes ejemplos:

# Primer elemento de la lista
mi_lista_nombres["A"]

# Primer elemento de la lista, simplificando la salida
mi_lista_nombres[["A"]]

# Primer elemento de la lista, simplificando la salida
mi_lista_nombres$A

# Primer componente del primer elemento de la lista
mi_lista_nombres$A[1]
unlist(mi_lista_nombres[1])[1]

# Primera columna del tercer elemento
mi_lista_nombres$C[, 1]
mi_lista_nombres$`C`[, 1] # Equivalente

# Segundo elemento de la primera columna
# del tercer elemento de la lista
mi_lista_nombres$C[, 1][2]
mi_lista_nombres$C[2, 1] # Equivalente



# Numero de elementos de lista --------------------------------------------
#   La longitud de una lista es el numero de objetos dentro de la lista. Puedes 
#   obtener el numero de elementos de la lista con la funcion length. Si quieres
#   conocer la longitud de cualquier objeto dentro de la lista, primero deberias 
#   extraer el elemento correspondiente.

# Numero de elementos de la lista
length(mi_lista) # 3

# Numero de elementos del primer objeto
length(mi_lista[[2]]) # 5



# Lista de listas: Listas anidadas ---------------------------------------
#   Tambien puedes anidar listas en R. Esto significa que en todos o algunos elementos 
#   de tu lista raiz tendras una lista. Esa lista tambien puede almacenar otras listas 
#   u otros tipos de objetos. Puedes lograr esto con la funcion list, agregando listas 
#   en los elementos. En este ejemplo, vamos añadir a una lista las dos listas creadas 
#   en las secciones anteriores.

list_de_listas <- list(mi_lista, mi_lista_nombres)
list_de_listas


# Accediendo a listas anidadas --------------------------------------------

#   Acceder a elementos de listas dentro de listas es similar a acceder a los elementos 
#   a una lista. De hecho, si accedes a una lista y la almacenas dentro de un objeto,
#   el proceso es el mismo que se presenta en la seccion de extraccion de elementos de una 
#    lista anidada. De lo contrario, deberias conocer y seguir el nivel de jerarquia de la lista.
#   Tienes algunos ejemplos en el siguiente bloque de codigo:

# Accediendo a la primera lista
list_de_listas[[1]]

# Accediendo a la segunda lista
list_de_listas[[2]]

# Primer objeto de la segunda lista
list_de_listas[[2]][[1]] # 45 12 56 14 16

# Tercer elemento del primer objeto
# de la segunda lista
list_de_listas[[2]][[1]][3] # 56
list_de_listas[[2]]$A[3]    # Equivalente

# Puedes guardar las listas en objetos
# y acceder a los elementos de esa lista
# como explicamos en la sección correspondiente
lista_1 <- list_de_listas[[1]]

# Este seria el primer objeto
# de la primera lista
lista_1[[1]] 

# Convertir lista en dataframe --------------------------------------------
#   Supon que tienes una lista que contiene datos de algunas variables. En ese caso,
#   es posible que desees convertir tu lista a un data frame. Para lograrlo, puedes
#   usar las funciones unlist, matrix y data.frame o do.call de la siguiente manera.

mi_lista_4 <- list(c(1, 7, 3), c(9, 8, 1))

data.frame(matrix(unlist(mi_lista_4), nrow = length(mi_lista_4), byrow = TRUE))
do.call(rbind.data.frame, mi_lista_4) # Similar


#--------------------------------#
# Tip de Funciones
#--------------------------------#

# Cuando utilizas una paquete puedes usar la libreria y luego las funciones
# O utilizas la funcion de forma directa anteponiendo el nombre del paque con ::

lubridate::today()

library(lubridate)
today()

# Te puedes percatar que el paquete no esta abierto cuando no se autocompleta




#--------------------------------#
# Ejemplo Incidence
#--------------------------------#

# Instalamos los siguientes paquetes

# outbreaks y incidence

install.packages(c("outbreaks","incidence"))

library(outbreaks)
library(incidence)

# Utilizamos una base de datos del mismo paquete para practicar

ebola_sim

# utilizar una lista especifica

dat <- ebola_sim$linelist$date_of_onset
class(dat)

head(dat)

# Utilizamos la funcion incidence, que es lo que obtenemos?
i <- incidence(dat)

# Explora cada uno de sus elementos mediante lista
i$counts


# Plotea, con la funcion plot, cual crees que es la diferencia con ggplot?
plot(i)



# Otros ejemplos, mayor detalle de la funcion en el curso de brotes

i_7 <- incidence(dat, interval = "1 week")
plot(i_7)
getwd()

n <- fit(i_7[1:24])

plot(n)

plot(i_7[1:24], fit = n)
