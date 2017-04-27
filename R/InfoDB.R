InfoDB <- setClass(
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
