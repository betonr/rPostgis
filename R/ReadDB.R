#' readDB
#'
#' function responsible for searching the database and
#' returning numbers of occurrences on the select date
#'
#' @param objectInfo (InfoDB) - Object with informations for connections
#' @param date (character) - amount of previous days (Y-m-d)
#' @param type (character) - vehicle
#' @param uf (int) - UF desired
#'
#' @return Number of occurrences (int)
#'
setGeneric(
  "readDB",
  def = function(objectInfo, date, type, uf){
    standardGeneric("readDB")
  }
)

#' @method readDB rPostgis
#' @import RPostgreSQL
#' @importFrom DBI dbDriver
#'
setMethod("readDB", c("InfoDB","character", "character", "character"), function(objectInfo, date, type, uf){
  con<-NULL
  if(is.null(con)){
    driver <- dbDriver(objectInfo@accessDriver)
    con <- dbConnect(driver, host = objectInfo@host, port = objectInfo@port,
                     user = objectInfo@user, password = objectInfo@password,
                     dbname=objectInfo@db
    )
  }
  on.exit(dbDisconnect(con))

  sql <- sprintf("SELECT * FROM tb_dados WHERE type='%s' AND date='%s' AND uf='%s'",type,date,uf)
  res <- dbGetQuery(con, sql)
  numR <- nrow(res)+0

  return(numR)

})
