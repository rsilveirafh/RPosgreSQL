# 27 mar 2021
# Ricardo da Silveira Filho


# 0) Setup ----------------------------------------------------------------

library(tidyverse)


# 1) Anotações ------------------------------------------------------------

# Como instalar R e RStudio
# Encontrar diretório dos pacotes: .libPaths()

# Instalar R + PostgreSQL
## https://direito.consudata.com.br/rpsql/plr/

# Aluguel de máquina virtual
## https://contabo.com/en/ (7 U$ mês)

# R e RStudio na nuvem
## https://direito.consudata.com.br/r/rnuvem/


# 2) Acessando PostgreSQL -------------------------------------------------

# Acessar posgresql:
## sudo -u postgres psql

# Criar usuário
## create user NOME with login password 'XXX';
## create user ricardo with login password '123456';

# Criar um banco de dados
## create database teste01 owner ricardo;

# Garantir acesso à um usuário
## grant all on database teste01 to ricardo;

# Instalar pacote RPostgres e DBI (necessário instalar libpq)
install.packages("RPostgres")

# Abrindo uma conexão com a máquina local (localhost)
## Em uma máquina virtual, mudar host (direito.consudata.com.br, p.ex.)
## Colocar conexão segura, colocar senha no Sys.env
conn <- DBI::dbConnect(RPostgres::Postgres(), 
					   host = "localhost",
					   user = "postgres",
					   dbname = "postgres",
					   password = "senha")

# Dados na máquina para teste
conn <- DBI::dbConnect(RPostgres::Postgres(), 
					   host = "localhost",
					   user = "ricardo",
					   dbname = "teste01",
					   password = "123456")

conn

# "Tunar" o PostgreSQL
## https://pgtune.leopard.in.ua/#/
## Ajeitar as configurações, clicar em ALTER SYSTEM, copiar e colar no terminal com o postgres.


# Encerrar a conexão
DBI::dbDisconnect(conn)

























