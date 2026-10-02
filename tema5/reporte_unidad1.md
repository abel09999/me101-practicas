## a) Estadísticos descriptivos
Para la columna nota obtuve una media de {n_res['media']}, una desviación
estándar muestral de {n_res['desv_std']} y un coeficiente de variación de
{n_res['cv_pct']} %. Para asistencia_pct la media fue {a_res['media']}, la
desviación estándar {a_res['desv_std']} y el CV {a_res['cv_pct']} %. Usé el CV
porque las dos variables tienen unidades distintas y la desviación estándar
sola no permite compararlas.

## b) Nivel de dispersión
Según mi función clasificar_dispersion(), nota tiene dispersión {n_cls} y
asistencia_pct tiene dispersión {a_cls}.

## c) Diferencias de convención entre librerías
Descubrí que Python y R no siempre dan el mismo resultado. En la varianza de
nota, numpy dio 7.66 y R dio 9.575, porque numpy divide entre n por defecto
(ddof=0) y R entre n-1. Con la asimetría y la curtosis pasó algo parecido:
pandas y e1071 dieron valores distintos porque cada una usa una fórmula
diferente por defecto (type = 2 y type = 3). Aprendí que siempre hay que
revisar qué parámetro usa cada función antes de comparar resultados.
"""
