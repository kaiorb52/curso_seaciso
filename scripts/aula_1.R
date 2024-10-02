# dia_2.R
# R - 4.4.1/4.3.3
# Kaio Ribeiro

# Tipos de dados ----------------------------------------------------------

"João" # String  - Caractere
1.5    # Numeric - Numerico
TRUE   # Logical - Logico

NA     # Not avaiable number - Numero não existente
NULL   # NADA


# Criação de objetos ------------------------------------------------------

x  <- 1
y  <- 50

uf <- "RJ"

resultado <- x + y

resultado <- x + uf


# Estrutura de dados ------------------------------------------------------

# Vetores

alunos <- c("João", "Maria", "Lucas", "Luiza", "David")
alunos

notas <- c(7, 9, 5.9, 6, 4)
notas

alunos[1]
alunos[1000]
alunos[-5]


# Data.frame

dados_alunos <- data.frame(
  "aluno" = alunos,
  "nota"  = notas
)

dados_alunos[1]
dados_alunos[, 1]
dados_alunos[1, ]

dados_alunos$nota

dados_alunos$nota >  6
dados_alunos$nota >= 6

dados_alunos$aprovado <- dados_alunos$nota >= 6
dados_alunos$aprovado


# Funções -----------------------------------------------------------------

# Variaveis Numericas

mean(dados_alunos$nota)
median(dados_alunos$nota)
min(dados_alunos$nota)
max(dados_alunos$nota)

summary(dados_alunos$nota)

round(1.8102214125121)
round(1.8102214125121, digits = 2)

p <- round(1.8102214125121, digits = 2)

# Variaveis Categoricas

paste0("cch", "-UENF")
paste0(p, " %")

genero <- c("M", "F", "M", "F", "F")
table(genero)

toupper("Rio de Janeiro")
tolower("MACAE")

# etc..

rep("🥸", 10)
seq(2000, 2022, by = 3)

