#TRABAJO FINAL DE R
install.packages("readxl")
library(readxl)

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#1º EJERCICIO: Carga los datos y examínalos en R. Emplea las funciones head(), summary(), dim() y str().
#¿Cuántas variables hay?¿Cuántos tratamientos?

#En primer lugar, nombramos la variable datos, con la cual, mediante la función read.table y la dirección del archivo podemos cargar nuestro archivo para así trabajr con él.
#Y utilizamos las funciones sep="\t", header=TRUE  que sirven para que reconocer los encabezados de las tablas
  datos <- read.table("C:/Users/roica/Documents/Universidad/4º BIOMEDICINA/1º Cuatri/Bioinformatica/R/Trabajo R final/datos-trabajoR.txt",header = TRUE, sep = "\t")

#Una vez cargado el archivo al que hemos nombrado "datos", vamos a examinar con cada una de las siguientes funciones head(), summary(), dim() y str().

#Con esta función observamos las primeras filas de nuestra tabla de datos en la consola
  head(datos)
#Con esta otra función podemos ver en nuestra consola qué tipo de datos proporciona cada columna de la tabla
  summary(datos)
# Esta función nos dice las dimensiones tanto de las columnas como de las filas en la tabla de datos.
  dim(datos)
# La última función nos dice representa la estructura de nuestra tabla de datos en la consola
  str(datos)

#Ya podemos responder los dos preguntas del ejercicio.¿Cuántas variables hay?¿Cuántos tratamientos?
#RESPUESTAS: HAY 4 VARIABLES LO QUE QUEDA CLARO AL EJECUTAR EL head(datos) Y HAY HASTA 6 TRATAMIENTOS DIFERENTES, PODEMOS OBSERVARLO EN LA FUNCIÓN summary(datos)
#Confirmamos que los tratamiento sin repeticiónes son hasta 6 con la función unique. Y que el total de ellos es 55 con la función nrow que cuenta todas las filas
  paste("Tratamiento:",unique(datos$Tratamiento))
  paste("Tratamientos totales(repetidos incluidos):",nrow(datos))

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#2º EJERCICIO: Haz un boxplot para nuestros datos. Uno para cada condición. Elige un color para cada condición y guárdalo para las siguientes gráficas.

#Para realizar un box plot donde cada condición se represente de un color diferente, vamos a comenzar estableciendo los colores para cada variable.
  colores <- c("Wildtype" = "green", "Sequia" = "red", "ExcesoRiego" = "blue")
#Para ello hemos realizado un vector "c" con el que definimos cada condición con un color.  

#Después creamos el boxplot con la función de su mismo nombre, especificando cada condición con la función datos $(dentro de los datos.)
  boxplot(datos$Wildtype, datos$Sequia, datos$ExcesoRiego, 
        names = c("Wildtype", "Sequia", "ExcesoRiego"),
        col = colores,
        main = "Boxplot de datos-trabajoR",
        ylab = "Valores")
#A continuación, hemos metido dentro de la función boxplot las siguientes funciones con su correspondiente utilidad:
 #Names: etiqueta cada caja del eje x con los nombres que le queremos dar.
 #Col: asigna a cada condición los colores previamente asignados
 #Main: le damos título al boxplot
 #ylab: etiquetamos el eje y con el nombre valores

#Tras ejecutar el boxplot, solo faltaría ejecutarlo, y podremos observarlo. Y finalmente creamos una nueva condición "colores condiciones" para guardar los colores de la función vector "c".
  colores_condiciones <- colores

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#3º EJERCICIO: Haz dos gráficos de dispersión. El primero debe comparar Sequía con Wildtype, y el segundo ExcesoRiego con Wildtype. Cada tratamiento debe de ir de un color distinto. Pista: usa col=datos$Tratamiento.

#En primer lugar, con la función plot creamos un gráfico de dispersión. 
#1ºGRÁFICO(Sequía vs Wildtype): Vamos a introducir lo deseados para el primer grafico en la función plot. 
 #Diferenciamos cada condición con la función datos$ (dentro de)
 plot(datos$Wildtype, datos$Sequia,
     col = datos$Tratamiento, 
     pch = 19,                
     xlab = "Wildtype",       
     ylab = "Sequía",         
     main = "Sequía vs Wildtype")
#A continuación, introducimos dentro de la función plot las siguientes variables:
 #Col: asigna a cada condición un color
 #Pch: asigna la forma/diseño de la representación de puntos. La más representativa es la 19 que forma circulos rellenos.
 #Xlab: nombramos el eje x con la etiqueta Wildtype
 #Ylab: lo mismo en el eje y con la etiqueta Sequia
 #Main: titulamos el gráfico de dispersión 1
#2ºGRÁFICO(ExcesoRiego vs Wildtype): Para este segundo gráfico, hacemos lo mismo que el anterior pero cambiando la condición Sequia con la de ExcesoRiego.
 plot(datos$Wildtype, datos$ExcesoRiego,
     col = datos$Tratamiento, 
     pch = 19,                
     xlab = "Wildtype",       
     ylab = "ExcesoRiego",         
     main = "Exceso de Riego vs Wildtype")
#Finalmente vamos a asignar la función col para emplear diferentes colores a cada uno de los tratamientos y que así se represente en los gráficos
 col = colores_condiciones[datos$Tratamiento]


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


#4º EJERCICIO: Ponle leyenda al gráfico del apartado anterior. En el margen inferior derecho. Pista:investigasobrelegend().
#Utilizamos la función legend para crear la leyenda, inmediatamente a continuación especificamos dónde queremos situarla.
 legend("bottomright",                
       legend = unique(datos$Tratamiento), # Etiquetas de la leyenda
       col = unique(datos$Tratamiento),    # Colores correspondientes
       pch = 19,                           # Forma de los puntos
       title = "Tratamiento")
#Dentro de la función legend, además, introduciremos diferentes funciones:
#Legend: queremos que mire dentro de la condición tratamientos, especificando con unique para que cuente cada uno de ellos
#Col: junto con la función unique asignamos a cada tratamiento un color diferente y que así quede reflejado en la leyenda.
#Pch: de nuevo utilizamos esta función para representar cada color con un punto en forma de circulo relleno(19) y así represente cada tratamiento.
#Title: finalmente con esta función titularemos la leyenda con el nombre de "Tratamiento".


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#5º EJERCICIO: Haz un histograma para cada variable. Recuerda mantener los colores. 
#Vamos a utilizar la función hist para crear cada histograma por separado. Y utilizaremos la función datos$ para concretar la condición que queremos representar.

#1ºHISTOGRAMA(Wildtype)
 hist(datos$Wildtype,
     col = "green",            
     main = "Histograma de Wildtype", 
     xlab = "Wildtype",       
     ylab = "Frecuencia")
#Como previamente, utilizaremos las funciones col, main, xlab e ylab para diseñar nuestro hiograma respetando los colores que seleccionamos en el segundo ejercicio.

#2ºHISTOGRAMA(Sequía)
 hist(datos$Sequia,
     col = "red",             
     main = "Histograma de Sequía",
     xlab = "Sequía",         
     ylab = "Frecuencia")
#Realizamos lo mismo que en el 1ºhisograma pero cambiando los datos de wildtype con sequía

#3ºHISTOGRAMA(ExcesoRiego)
 hist(datos$ExcesoRiego,
     col = "blue",           
     main = "Histograma de Exceso de Riego", 
     xlab = "ExcesoRiego",    
     ylab = "Frecuencia")


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#6º EJERCICIO: Haz un factor en la columna tratamiento y guárdalo en una variable. Pista: factor(factor$Tratamiento)
#Utilizamos la función factor  para cambiar la categoria de una columna, en este caso de tratamientos para hacerla factor.
#Además, creamos la variable tratamiento_factor para guardarlo.
 tratamiento_factor <- factor(datos$Tratamiento)
# Finalmente comprobamos si se ha guardado bien la variable con la función print.
 print(tratamiento_factor)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#7º EJERCICIO: Calcula la media y la desviación estándar para cada tratamiento. Recomendación: es más fácil si usas aggregate() o tapply().(1pto)
#aggregate(Variable~factor,datos,función)#tapply(datos$Variable,factor,función)

#En primer lugar creamos una variable llamada "media_por_tratamiento"
#Después utilizamos la función aggregate, para realizar ambas cosas (media y desviación) aunque las realizaremos por separado.
 media_por_tratamiento <- aggregate(cbind(Wildtype, Sequia, ExcesoRiego) ~ Tratamiento, datos, mean)
#Dentro de la función aggregate, añadimos los siguientes comandos:
 #Cbind: combina en este caso cada una de las condiciones (Wildtype, Sequia, ExcesoRiego) para así poder manipulalas de la misma forma y a la vez.
 #Tratamiento: con este queremos que agrupe los datos de la columna tratamiento para definir los diferentes grupos.
 #Datos: queremos que coja la sección de datos de nuestro archivo
 #Mean: la función para aplicar la media

# Ahora, vamos a realizar lo mismo pero creando en este caso la variable "desviacion_por_tratamiento"
#Usaremos al igual que para la media la función aggregate, con todo lo anterior(cbind, Tratamiento,datos))
 desviacion_por_tratamiento <- aggregate(cbind(Wildtype, Sequia, ExcesoRiego) ~ Tratamiento, datos, sd)
#Sin embargo, en esta ocasión sustituimos el Mean, que era el comando para realizar la media por el sd.
 #Sd: esta es la función que aplica la desviación estandar.

# Para acabar con este ejercicio, ejecutamos la función print para cada variable para ver si los comandos son correctos y relizan la función adecuadamente.
 print(media_por_tratamiento)
 print(desviacion_por_tratamiento)
#RESPUESTA: Al ejecutar podemos ver cada media y desviación estandar para los tratamientos.



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


#8º EJERCICIO: Averigua cuántos elementos tiene cada tratamiento. Recomendación: es más fácil si usas table() con el factor.

# Vamos a utilizar la función table que sirve para contar las funciones factor. 
# En nuestro caso, previamente ya habíamos realizado la función factor para la columna de tratamientos en el ejercicio 6. Al que hemos nombrado "tratamiento_factor" 
# Finalmente cramos la variable "conte_tratamientos" para meter la función table
 conteo_tratamientos <- table(tratamiento_factor)
# En último lugar, con la función print, comprobamos si podemos averiguar cuantos elementos tiene cada tratamiento.
 print(conteo_tratamientos)
#RESPUESTA: Al ejecutar comprobamos que cada tratamiento posee 10 elementos, exceptuando el tratamiento 6 que tiene 5 elementos.



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


#9º EJERCICIO: Extrae los datos para el tratamiento 1 y el tratamiento 4 y guárdalos cada uno en una variable diferente.

# Vamos a comenzar con la extracción de los datos de los tratamientos 1 y 4. 
# Para ello empleamos la función subset, que extrae exactamente los datos que nos interesen una vez especificados
# Además crearemos dos variables nuevas, una por cada tratamiento extraido.

# TRATAMIENTO 1:
 tratamiento_1 <- subset(datos, Tratamiento == 1)
# TRATAMIENTO 4:
 tratamiento_4 <- subset(datos, Tratamiento == 4)
# En ambos casos, igualamos Tratamiento al número en concreto que queremos extraer.
# Finalmente, con la función print, comprobamos que este correctamente el comando.
 print("Datos del Tratamiento 1:")
 print(tratamiento_1)

 print("Datos del Tratamiento 4:")
 print(tratamiento_4)



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


#10º EJERCICIO: Queremos comprobar que hay diferencias significativas para el tratamiento 1 y el tratamiento 5 entre Wildtype y Sequia, y entre Wildtype y ExcesoRiego. 
# Primero, necesitaríamos comprobar si los datos se distribuyen de forma normal. En función de los resultados de la prueba de normalidad, ¿qué test usarías para cada comparativa?
# ¿Puedes comparar también Sequia con ExcesoRiego en ambos tratamientos.
# En general, asumimos que las muestras son independientes, pero ¿son sus varianzas iguales? Actúa de acuerdo con tus resultados. 

# Para comenzar vamos a sacar los datos de nuestro archivo, como hemos realizado en el ejercicio anterior pero esta vez para los tratamientos 1 y 5
 tratamiento_1 <- datos[datos$Tratamiento == 1, ]
 tratamiento_5 <- datos[datos$Tratamiento == 5, ]

##Tratamiento 1:

# Ahora vamos a emplear la función shapiro.test que sirve para comprobar si los datos son normales en cada caso
# Realizaremos un shapiro test para cada condición. Y nombraremos cada test con una variable nueva.
  shapiro_1_Wildtype<-shapiro.test(tratamiento_1$Wildtype)  
  shapiro_1_Sequia<-shapiro.test(tratamiento_1$Sequia)    
  shapiro_1_ExcesoRiego<-shapiro.test(tratamiento_1$ExcesoRiego)
 #Con la función print comprobamos que este bien
  print(shapiro_1_Wildtype)
  print(shapiro_1_Sequia)
  print(shapiro_1_ExcesoRiego)
# Ahora vamos a comprobar la varianza para ver si los datos son normales. Para ello vamos a usar la función var.test
# Y al igual que antes, creamos nuevas variables que nombren la acción de cada test. Esta vez vamos a usar solo la condición de sequia y la de exceso de riego

  var_1_wild_sequia <- var.test(tratamiento_1$Wildtype, tratamiento_1$Sequia)
  var_1_wild_exceso <- var.test(tratamiento_1$Wildtype, tratamiento_1$ExcesoRiego)
#Con la función print comprobamos que se ha puesto el comando correcto
 print(var_1_wild_sequia)
 print(var_1_wild_exceso)
#A continuación vamos a comparar el wildtype con sequia, y por otro lado con el exceso.
#Usaremos un condicional para que viendo los test previos, compruebe si las varianzas estan en rango.
 #Wildtype-Sequia
 if (shapiro_1_Wildtype$p.value > 0.05 & shapiro_1_Sequia$p.value > 0.05) {
  print(t.test(tratamiento_1$Wildtype, tratamiento_1$Sequia, var.equal = var_1_wild_sequia$p.value > 0.05))
} else {
  print(wilcox.test(tratamiento_1$Wildtype, tratamiento_1$Sequia))}
 #Wildtype-Excesoriego
if (shapiro_1_Wildtype$p.value > 0.05 && shapiro_1_ExcesoRiego$p.value > 0.05) {
  print(t.test(tratamiento_1$Wildtype, tratamiento_1$ExcesoRiego, 
               var.equal = var_1_wild_exceso$p.value > 0.05))
} else {
  print(wilcox.test(tratamiento_1$Wildtype, tratamiento_1$ExcesoRiego))
}


#Ahora realizaremos los mismo para el tratamiento 5

##Tratamiento 5:
 shapiro_5_wildtype <- shapiro.test(tratamiento_5$Wildtype) 
 shapiro_5_sequia <- shapiro.test(tratamiento_5$Sequia)      
 shapiro_5_exceso <- shapiro.test(tratamiento_5$ExcesoRiego)

 print(shapiro_5_wildtype)
 print(shapiro_5_sequia)
 print(shapiro_5_exceso)

 var_5_wild_sequia <- var.test(tratamiento_5$Wildtype, tratamiento_5$Sequia)
 var_5_wild_exceso <- var.test(tratamiento_5$Wildtype, tratamiento_5$ExcesoRiego)

 print(var_5_wild_sequia)
 print(var_5_wild_exceso)

#Wildtype-Sequia
 if (shapiro_5_wildtype$p.value > 0.05 && shapiro_5_sequia$p.value > 0.05) {
  print(t.test(tratamiento_5$Wildtype, tratamiento_5$Sequia, var.equal = var_5_wild_sequia$p.value > 0.05))
} else {
  print(wilcox.test(tratamiento_5$Wildtype, tratamiento_5$Sequia))
}

# Wildtype vs ExcesoRiego
if (shapiro_5_wildtype$p.value > 0.05 && shapiro_5_exceso$p.value > 0.05) {
  print(t.test(tratamiento_5$Wildtype, tratamiento_5$ExcesoRiego, var.equal = var_5_wild_exceso$p.value > 0.05))
} else {
  print(wilcox.test(tratamiento_5$Wildtype, tratamiento_5$ExcesoRiego))
}

#RESPUESTAS: 1ºPregunta-- Podemos afirmar que los datos son de distribuciones normales para todas las condiciones del tratamietno 1 ya que todas superan un p-valor de 0,05
                          #Pero para el tratamiento 5, solo tiene una distribución normal la condición de excesoderiego.
             #2ºPregunta-- Dependiendo de la normalidad de los datos y de las igualdades de varianzas elegiriamos o un t-test o un wilcoxon-test.
             #3ºPregunta-- Sí, se puede comparar Sequia con ExcesoRiego en ambos tratamientos, de manera similar a la comparación entre Wildtype y Sequia, y entre Wildtype y ExcesoRiego.
                           # Usando las mismas pruebas de normalidad y de varianza, y aplicando el test adecuado (t-test o Wilcoxon).
             #4ºPregunta-- En general, se asume que las muestras son independientes. Para verificar si las varianzas son iguales, se realiza una prueba de varianza  var-test .
                          #Si el p-valor de la prueba de varianza es mayor que 0.05, se asume que las varianzas son iguales. Si el p-valor es menor o igual a 0.05, se asume que las varianzas son diferentes.
 


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#11º EJERCICIO: Realiza un ANOVA para comparar el tratamiento 1 en las tres condiciones. Pista: primero separa los valores de tratamiento 1 en Wildtype, Sequia y ExcesoRiego en variables separadas.
# Luego fíjate en el archivo “datos-anova.txt” y trata de colocar los datos de esa forma en una tabla. Por último, ejecuta el test.

#En primer lugar deberíamos cargar los datos del archivo en una variable, aunque en este caso no haria falta porque lo hemos hecho previamente en el ejercicio 10.
 tratamiento_1 <- datos[datos$Tratamiento == 1, ]
#Ahora vamos a realizar 3 nuevas variables que separen las tratamientos por condiciones de la siguiente forma:
 wildtype_1 <- tratamiento_1$Wildtype
 sequia_1 <- tratamiento_1$Sequia
 exceso_1 <- tratamiento_1$ExcesoRiego
#Ahora vamos a comenzar a crear el ANOVA.
#Creamos la variable llamada "datos_anova" que contendra el ANOVA. Utlizamos la función data.frame para coger las tres condiciones e introducirlas en el anova.
#Con el valor definimos las condiciones. Con la c, lo disponemos en un vector.
#La condición nombrará cada condición en el ANOVA.
#El rep creará un vector de etiquetas para cada situación, garantizando que cada conjunto posea la cantidad adecuada de observaciones.

 datos_anova <- data.frame(
   valor = c(wildtype_1, sequia_1, exceso_1), 
   condicion = rep(c("Wildtype", "Sequia", "ExcesoRiego"),  # Nombres de las condiciones
                   c(length(wildtype_1), length(sequia_1), length(exceso_1))) 
)
#Ahora vamos a ejecutar el ANOVA. Creando la variable "anova_resultado", y vamos a emplear la función aov que analizara la varianza
 anova_resultado <- aov(valor ~ condicion, data = datos_anova)

# Finalmente, summary mostrará los resultados del ANOVA, incluyendo el valor de p y la estadística F.
 summary(anova_resultado)
