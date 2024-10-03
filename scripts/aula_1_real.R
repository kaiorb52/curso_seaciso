# Aula_1.R
# Kaio


# Tipos de dados ----------------------------------------------------------

1.5              # Numerico
'Rio de Janeiro' # String
"Rio de Janeiro" # String
TRUE             # Verdaderio 
FALSE            # Falso
NA               # Não disponivel
NULL             # Nulo

x <- 1.5
x

y <- 50
y

uf <- "RJ"
uf

x + y
resultado <- x + y
resultado

x + uf

z <- (x + y) * y
z

# Estrutura de dados ------------------------------------------------------

'RIO'

alunos <- c('João', 'Maria', 'Lucas', 'Luiza')
alunos

notas <- c(7, 9, 5.8, 6)
notas

# Operações com vetores

juros = c(0.037,0.041,0.049)
5000*juros
juros <- c(3.7,4.1,4.9)/100
res <- 5000*juros
res


alunos[1]
alunos[1000]
alunos[-1]

tabela <- data.frame(
  "nome" = alunos,
  "nota" = notas
)

tabela
tabela[1]   # Coluna 1
tabela[, 1] # Coluna 1
tabela[2, ] # Linha  2
tabela[3, 2] # Linha 3, Coluna 2


tabela$nome
tabela$nota


# Funções -----------------------------------------------------------------

mean(tabela$nota)   # Media
median(tabela$nota) # Mediana
min(tabela$nota)    # Minimo
max(tabela$nota)    # Maximo

summary(tabela$nota) # Sumario

paste0("Macae", "-RJ")           # Colar palavras
paste0(tabela$nome, tabela$nome) # Colar nomes

genero <- c("F", "M", "F", "M", "F")
table(genero)
