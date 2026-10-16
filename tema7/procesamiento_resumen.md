Resumen de procesamiento de imágenes (Tema 7)
a) Figuras que dibujé

Creé una imagen de 120×120 píxeles con fondo morado oscuro (20, 0, 80) y le dibujé tres figuras separadas, cada una en su zona:

Círculo naranja (255, 140, 0), arriba a la izquierda.
Rectángulo verde (0, 200, 120), arriba a la derecha.
Línea cian (0, 255, 255), horizontal en la parte de abajo.
b) .convert('L') vs. rgb2gray()

Comparé los dos métodos en el píxel de fondo (x=5, y=60):

Método	Valor
Pillow .convert('L')	15
scikit-image rgb2gray() * 255	10.02

No coincidieron: hay una diferencia de unos 5 niveles de gris. Creo que se debe a que cada librería usa pesos distintos para mezclar los canales R, G y B, y a que Pillow devuelve un entero mientras que scikit-image devuelve un decimal entre 0 y 1. Mi fondo es casi todo azul, así que la diferencia de pesos se nota bastante.

c) Umbral de Otsu
Umbral de Otsu: 0.0407 (en la escala de 0 a 1 de rgb2gray).
Proporción de píxeles True: 0.233, es decir, un 23.3 % de la imagen quedó por encima del umbral.

Tiene sentido porque el umbral cae justo entre el fondo oscuro y las figuras, así que las tres figuras quedaron en blanco y el fondo en negro. 
