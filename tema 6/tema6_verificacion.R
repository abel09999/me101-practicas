

# Completa: reconstruye el degradado con matrix()
gris <- matrix(rep(seq(0, 255, length.out = 5), times = 5),
               nrow = 5, ncol = 5, byrow = TRUE)

# Completa: dim() y mean()
print(dim(gris))
print(mean(gris))



# Completa: reconstruye la imagen RGB con los mismos colores
# Python: izquierda = rojo (255,0,0), derecha = azul (0,0,255)
rgb <- array(0, dim = c(4, 4, 3))

# Canales: 1 = R, 2 = G, 3 = B
rgb[, 1:2, 1] <- 255   # mitad izquierda (cols 1-2): rojo
rgb[, 3:4, 3] <- 255   # mitad derecha (cols 3-4): azul

# Verifica los píxeles extremos (R indexa desde 1)
# Python rgb[0,0] -> R rgb[1,1,]   |   Python rgb[0,3] -> R rgb[1,4,]
cat("Pixel [1,1]:", rgb[1, 1, ], "\n")
cat("Pixel [1,4]:", rgb[1, 4, ], "\n")

cat("¿[1,1] coincide con Python (255,0,0)? ", identical(rgb[1, 1, ], c(255, 0, 0)), "\n")
cat("¿[1,4] coincide con Python (0,0,255)? ", identical(rgb[1, 4, ], c(0, 0, 255)), "\n")










# Completa: gris_luminosidad en R
# Fórmula: 0.299*R + 0.587*G + 0.114*B (cada canal es una matriz 4x4)
gris_luminosidad <- 0.299 * rgb[, , 1] + 0.587 * rgb[, , 2] + 0.114 * rgb[, , 3]

print(gris_luminosidad)

# Comparación con Python (filas: 76.245 76.245 29.07 29.07)
gris_py <- matrix(rep(c(76.245, 76.245, 29.07, 29.07), times = 4),
                  nrow = 4, ncol = 4, byrow = TRUE)

cat("¿Coincide con Python? ", isTRUE(all.equal(gris_luminosidad, gris_py)), "\n")
cat("Diferencia máxima:    ", max(abs(gris_luminosidad - gris_py)), "\n")

