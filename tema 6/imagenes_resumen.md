# Resumen del Tema 6: imágenes como datos

En esta semana construí dos imágenes sintéticas, una en escala de grises y otra a color, usando NumPy en Python y después las reconstruí en R para comprobar que daban lo mismo. Con esto entendí que una imagen es, en el fondo, una tabla de números.

## a) Dimensiones (shape) de mis imágenes

- **Imagen en escala de grises:** su shape es `(5, 5)`. Es una matriz 2D de 5 filas y 5 columnas, donde cada número es el brillo de un píxel, de 0 (negro) a 255 (blanco). La armé como un degradado horizontal con `np.linspace()` y `np.tile()`, y el resultado fue de tipo `float64` con una media de 127.5.
- **Imagen a color (RGB):** su shape es `(4, 4, 3)`. Tiene 4 filas, 4 columnas y 3 canales (rojo, verde y azul) por cada píxel. Es un array 3D de tipo `uint8`, así que cada canal va de 0 a 255.

## b) Colores elegidos y su luminosidad

Dividí la imagen RGB en dos mitades verticales de distinto color:

- **Mitad izquierda: rojo puro (255, 0, 0).** Con la fórmula de luminosidad ponderada (0.299·R + 0.587·G + 0.114·B), su valor es 0.299 × 255 = **76.245**.
- **Mitad derecha: azul puro (0, 0, 255).** Con la misma fórmula, su valor es 0.114 × 255 = **29.07**.

El rojo salió más brillante que el azul, y eso coincide con lo que percibo a simple vista, porque el ojo humano es más sensible al rojo que al azul. Con el promedio simple, en cambio, los dos colores daban 85 y no se distinguían, por eso la luminosidad ponderada refleja mejor lo que realmente vemos.

## c) Umbral de binarización

Usé el umbral **50**. Con el valor típico de 128, los dos colores habrían quedado en 0 (negro) y la binarización no habría mostrado ninguna diferencia. Como 50 está entre 29.07 (azul) y 76.245 (rojo), el rojo quedó en 1 y el azul en 0, y así las dos mitades de la imagen se separan bien.
