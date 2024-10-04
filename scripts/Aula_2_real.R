# Aula_2.R
# Kaio Ribeiro


# Introdução --------------------------------------------------------------

alunos <- data.frame(
  "nome" = c("João", "Maria", "João"),
  "nota" = c(6, 8, 5.9)
)

mean(alunos$nota)   # Media
median(alunos$nota) # Mediana
min(alunos$nota)    # Minimo
max(alunos$nota)    # Maximo

summary(alunos$nota) # Summario

paste0("Macae" , "-RJ") # Juntar duas palavras
  
rep(".", 5)              # Repetir 5 vezes
seq(2000, 2025, by = 5)  # Criar sequencia 

# Conversão ---------------------------------------------------------------

as.character(100) # Coverter numerico para character
as.logical(1)     # '' numerico para logical
as.logical(0)     # '' numerico para ''
as.numeric("Rio") # '' palavra para numerico

# Teste logico ------------------------------------------------------------

# == - Exatamente igual
# >= - Maior ou igual
# <= - Menor ou igual
# != - não é igual

x <- 10 
  
x == 10   # True
x >= 100  # False
x <= 100  # True
x != 10   # True


# Importações -------------------------------------------------------------

library(haven)   # Importação 
library(ggplot2) # Graficos
library(dplyr)   # Manipulação

link <- "http://datasets.americasbarometer.org/database/files/BRA_2023_LAPOP_AmericasBarometer_v1.0_w.dta"

lapop_23 <- read_dta(link)

View(lapop_23)

saveRDS(lapop_23, file = "lapop_23.rds")
write.csv(lapop_23, file = "lapop_23.csv")


# Visualização de dados ---------------------------------------------------

ggplot(data = lapop_23, aes(x = q2)) +
  geom_density(fill = "red3") +
  theme_bw() +
  labs(
    x = "Idade",
    y = NULL,
    title = "Grafico de densidade",
    caption = "Fonte: Lapop(2023)"
  )

ggplot(data = lapop_23, aes(x = q2)) +
  geom_histogram(
    binwidth = 5, 
    color = "black",
    fill = "red3"
  ) +
  theme_minimal()















