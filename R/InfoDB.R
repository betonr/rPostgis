#' InfoDB
#'
#' Class responsável por guardar os dados para conexão com o banco de dados.
#' Essa é utilizada pelo metodo readDB, onde ele busca as informações dessa classe
#' e executa leituras no banco de dados
#'
#' @slot title title of database - default = ''
#' @slot accessDriver server accesses for database postgres - default = 'PostgreSQL'
#' @slot path path your server- default = ''
#' @slot host url the server - default = 'localhost'
#' @slot port port the database server - default = '5432'
#' @slot user database user - default = 'postgres'
#' @slot password database password - default = 'root'
#' @slot db database name - default = ''
#' @slot timeout time limit - default = '4'
#' @slot encoding  - default = 'CP1252'
#' @slot dbtype database type - default = 'POSTGIS'
#'
#' @import methods
#'
InfoDB <- setClass(
  # Define class InfoDB
  "InfoDB",

  slots = c(
    title = "character",
    accessDriver="character",
    path="character",
    host="character",
    port="character",
    user="character",
    password="character",
    db="character",
    timeout="character",
    encoding="character",
    dbtype="character"
  ),

  prototype=list(
    title = "",
    accessDriver="PostgreSQL",
    path="",
    host="localhost",
    port="5432",
    user="postgres",
    password="root",
    db="db_lingR",
    timeout="4",
    encoding="CP1252",
    dbtype="POSTGIS"
  )
)
