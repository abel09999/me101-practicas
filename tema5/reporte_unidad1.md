# Reporte Unidad I

## a) Estadísticos descriptivos
Para la columna nota obtuve una media de 14.3 y una desviación estándar
muestral de 3.09, lo que da un coeficiente de variación de 21.6 %.
Para asistencia_pct la media fue ___, la desviación estándar ___ y el
CV ___ %. Usé el CV porque las dos variables tienen unidades distintas
y la desviación estándar sola no permite compararlas.

## b) Nivel de dispersión
Según mi función clasificar_dispersion(), nota tiene dispersión
Moderada, porque su CV está entre 15 y 30. asistencia_pct tiene
dispersión ___.

## c) Diferencias de convención entre librerías
Descubrí que Python y R no siempre dan el mismo resultado. En la
varianza de nota, numpy dio 7.66 y R dio 9.575, porque numpy divide
entre n por defecto y R entre n-1. Con la asimetría y la curtosis
pasó algo parecido: pandas y e1071 dieron valores distintos porque
cada una usa una fórmula diferente por defecto. Aprendí que siempre
hay que revisar qué parámetro usa cada función antes de comparar.
