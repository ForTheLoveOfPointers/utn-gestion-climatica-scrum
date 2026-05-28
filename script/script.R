# Instalar y cargar librerias necesarias
if (!require("ggplot2")) install.packages("ggplot2", repos = "https://cran.r-project.org")
library(ggplot2)

# Cargar el dataset mensual
dataset <- read.csv("../datos/monthly.csv")

# --- Metricas de Anomalia ---

# Anomalia Promedio Global: media de las desviaciones termicas historicas
Rpromedio_anomalia <- mean(dataset$Mean, na.rm = TRUE)

# Anomalia Maxima Registrada: pico historico de desviacion (ano/mes mas caluroso)
Rmax_anomalia <- max(dataset$Mean, na.rm = TRUE)

# Anomalia Minima Registrada: punto mas bajo del registro (ano/mes mas frio)
Rmin_anomalia <- min(dataset$Mean, na.rm = TRUE)

# Mostrar resultados en consola
cat("Promedio de anomalia global:", Rpromedio_anomalia, "\n")
cat("Maxima anomalia registrada:", Rmax_anomalia, "\n")
cat("Minima anomalia registrada:", Rmin_anomalia, "\n")

# --- Tendencia por Decada ---

# Extraer decada del año
dataset$Decada <- floor(as.numeric(substr(dataset$Year, 1, 4)) / 10) * 10

# Promedio de anomalia por decada
tendencia_decada <- aggregate(Mean ~ Decada, data = dataset, FUN = mean, na.rm = TRUE)

# Modelo lineal para medir la tendencia
modelo <- lm(Mean ~ Decada, data = tendencia_decada)
pendiente <- coef(modelo)[2]

cat("Pendiente de tendencia por decada:", round(pendiente, 5), "°C/decada\n")

# --- Grafico de serie temporal con ggplot2 ---

# Preparar columna de fecha
dataset$Date <- as.Date(paste0(dataset$Year, "-01"), "%Y-%m-%d")


# Constantes para la creación de imágenes
graph_dpi <- 85 

p <- ggplot(dataset, aes(x = Date, y = Mean)) +
  geom_line(color = "steelblue", linewidth = 0.5) +
  geom_hline(yintercept = 0, linetype = "dashed", color = "gray50") +
  geom_hline(yintercept = Rpromedio_anomalia, linetype = "dotted", color = "red") +
  labs(
    title = "Anomalia Termica Global Mensual",
    x = "Ano",
    y = "Anomalia (°C)"
  ) +
  theme_minimal() +
  annotate("text",
    x = min(dataset$Date), y = Rpromedio_anomalia,
    label = paste("Promedio:", round(Rpromedio_anomalia, 3)),
    hjust = 0, vjust = -0.5, color = "red", size = 3
  )

ggsave("../resultados/anomalia_mensual.png", plot = p, width = 9, height = 5, dpi = graph_dpi)

cat("Grafico guardado en resultados/anomalia_mensual.png\n")

# --- Grafico de tendencia por decada ---

p2 <- ggplot(tendencia_decada, aes(x = Decada, y = Mean)) +
  geom_col(fill = "tomato", alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE, color = "blue", linetype = "dashed", linewidth = 0.8) +
  labs(
    title = "Tendencia de Anomalia Termica por Decada",
    x = "Decada",
    y = "Anomalia Promedio (°C)"
  ) +
  theme_minimal()

ggsave("../resultados/tendencia_decadas.png", plot = p2, width = 9, height = 5, dpi = graph_dpi)

cat("Grafico guardado en resultados/tendencia_decadas.png\n")