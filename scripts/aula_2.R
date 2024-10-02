# dia_2.R
# R - 4.4.1/4.3.3
# Kaio Ribeiro

library(haven)
library(ggplot2)
library(dplyr)

# Importação ================================================================

# haven
read_dta() # Importação de dados stata(.dta)
read_sav() # Importação de dados SPSS (.sav)

url <- "http://datasets.americasbarometer.org/database/files/BRA_2023_LAPOP_AmericasBarometer_v1.0_w.dta"

lapop_23 <- read_dta(url)

View(lapop_23)

# Visualização de Dados 1 ===================================================

# ggplot
geom_density()   # Curva de densidade
geom_histogram() # Histograma
geom_boxplot()   # Grafico de caixa


media  <- mean(lapop_23$q2)
mediana <- median(lapop_23$q2)

ggplot(data = lapop_23, aes(x = q2)) +
  geom_density(fill = "grey") +
  theme_bw() +
  labs(
    x = "Idade",
    y = NULL,
    title = "Curva de densidade - Idade(q2)",
    caption = "Fonte: LAPOP(2023)"
  ) +
  geom_vline(
    xintercept = media,
    color = "red",
    size = 2,
    linetype = "dotted"
  ) +
  geom_vline(
    xintercept = mediana,
    size = 2,
    color = "steelblue",
    linetype = "dotted"
  )

ggplot(data = lapop_23, aes(x = q2)) +
  geom_histogram() +
  theme_bw()

ggplot(data = lapop_23, aes(x = q2)) +
  geom_boxplot() +
  theme_bw()

# Manipulação de Dados ======================================================

# dplyr
filter()    # filtra os dados escolhidos
mutate()    # cria/modifica as variaveis
group_by()  # Agrupa os dados com base na variavel escolhida
summarise() # Cria panilhas de resumo/novas estatisticas


lapop_23 <- lapop_23 |>
  mutate(
    pol1_categorias = case_when(
      pol1 == 1 ~ "Nenhum interesse",
      pol1 == 2 ~ "Pouco interesse",
      pol1 == 3 ~ "Algum interesse",
      pol1 == 4 ~ "Muito interesse"
    ),
    q2_categorias = case_when(
      q2 <= 20            ~ "20-",
      q2 >  20 & q2 < 30  ~ "21-30",
      between(q2, 31, 40) ~ "31-40",
      between(q2, 41, 50) ~ "41-50",
      between(q2, 51, 60) ~ "51-60",
      q2 > 60  ~ "61+"
    ),
    pol1_categorias = factor(pol1_categorias, levels = c("Nenhum interesse", "Pouco interesse", "Algum interesse", "Muito interesse"))
  )

dados <- lapop_23 |>
  filter(!is.na(q2_categorias)) |>
  group_by(q2_categorias, pol1_categorias) |>
  summarise(
    contagem   = n()
  ) |>
  mutate(
    percentual = (contagem/sum(contagem)) * 100
  )


# Visualização de Dados 2 ===================================================

dados |>
  ggplot(aes(x = percentual, y = q2_categorias, fill = pol1_categorias)) +
  geom_col(color = "black") +
  scale_fill_brewer(type = "qual", palette = 1) +
  theme_minimal()

dados |>
  ggplot(aes(x = percentual, y = q2_categorias, fill = pol1_categorias)) +
  geom_col(color = "black") +
  scale_fill_brewer(type = "seq", palette = "OrRd") +
  theme_minimal()


# -------------------------------------------------------------------------

dados |>
  ggplot(aes(x = contagem, y = q2_categorias, fill = pol1_categorias)) +
  geom_col(color = "black") +
  scale_fill_brewer(type = "qual", palette = 1) +
  theme_minimal()

dados |>
  ggplot(aes(x = contagem, y = q2_categorias, fill = pol1_categorias)) +
  geom_col(color = "black", position = "dodge") +
  scale_fill_brewer(type = "qual", palette = 1) +
  theme_minimal()

# -------------------------------------------------------------------------


(grafico <- dados |>
  ggplot(aes(x = percentual, y = q2_categorias, fill = pol1_categorias)) +
  geom_col(color = "black") +
  scale_fill_brewer(type = "seq", palette = "OrRd") +
  theme_minimal() +
  theme(
    legend.position = "bottom"
  )
)

ggsave(
  plot     = grafico,
  filename = "Plot.png",
  height   = 7,
  width    = 12
)

