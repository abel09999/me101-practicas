# ============================================================
# tema10_verificacion.R  -  Tareas 2 y 3
# ============================================================
graphics.off()
library(tidyverse)
library(pheatmap)

# ---- Directorio de trabajo (ajusta esta ruta) ----
carpeta <- "C:/Users/User/me101-practicas/tema10"
dir.create(carpeta, showWarnings = FALSE, recursive = TRUE)
setwd(carpeta)

# ---- Dataset y matriz de correlación (igual que Python) ----
ruta <- "C:/Users/User/Downloads/datos_estaciones_meteorologicas_tema9.csv"
datos <- read.csv(ruta) |> select(where(is.numeric))

# Quita columnas constantes o sin datos
datos <- datos[, sapply(datos, function(x) {
  s <- sd(x, na.rm = TRUE)
  !is.na(s) && s > 0
})]

matriz_corr <- cor(datos, method = "pearson", use = "pairwise.complete.obs")
print(anyNA(matriz_corr))        # debe dar FALSE
print(round(matriz_corr, 4))

# ============================================================
# TAREA 2: ggplot2
# ============================================================
corr_larga <- as.data.frame(matriz_corr) |>
  rownames_to_column("var1") |>
  pivot_longer(-var1, names_to = "var2", values_to = "r") |>
  mutate(var1 = factor(var1, levels = rownames(matriz_corr)),
         var2 = factor(var2, levels = colnames(matriz_corr)))

print(nrow(corr_larga))
print(nrow(corr_larga) == ncol(matriz_corr)^2)   # debe dar TRUE

p <- ggplot(corr_larga, aes(x = var2, y = var1, fill = r)) +
  geom_tile(color = "white") +
  geom_text(aes(label = sprintf("%.2f", r)), size = 3.5) +
  scale_fill_gradient2(low = "blue", mid = "white", high = "red",
                       midpoint = 0, limits = c(-1, 1), name = "Pearson") +
  scale_y_discrete(limits = rev(levels(corr_larga$var1))) +
  coord_fixed() +
  labs(title = "Matriz de correlación (ggplot2)", x = NULL, y = NULL) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(p)
ggsave("heatmap_ggplot2.png", plot = p, width = 8, height = 6, dpi = 300)

# ============================================================
# TAREA 3: pheatmap
# ============================================================

# ---- CON agrupamiento (se muestra en pantalla y se guarda) ----
res_agrupado <- pheatmap(matriz_corr,
                         display_numbers = TRUE,
                         number_format = "%.2f")

png("heatmap_pheatmap_agrupado.png", width = 8, height = 6, units = "in", res = 300)
grid::grid.newpage()
grid::grid.draw(res_agrupado$gtable)
dev.off()

# ---- SIN agrupamiento (se muestra en pantalla y se guarda) ----
res_sin_agrupar <- pheatmap(matriz_corr,
                            display_numbers = TRUE,
                            number_format = "%.2f",
                            cluster_rows = FALSE,
                            cluster_cols = FALSE)

png("heatmap_pheatmap_sin_agrupar.png", width = 8, height = 6, units = "in", res = 300)
grid::grid.newpage()
grid::grid.draw(res_sin_agrupar$gtable)
dev.off()

# ---- Comparación del orden de las variables ----
orden_agrupado    <- rownames(matriz_corr)[res_agrupado$tree_row$order]
orden_sin_agrupar <- rownames(matriz_corr)

print(orden_agrupado)
print(orden_sin_agrupar)
print(identical(orden_agrupado, orden_sin_agrupar))   # FALSE = el orden cambió

# ---- Verificar que se crearon los 3 PNG de R ----
print(file.exists(c("heatmap_ggplot2.png",
                    "heatmap_pheatmap_agrupado.png",
                    "heatmap_pheatmap_sin_agrupar.png")))   # deben ser TRUE TRUE TRUE

