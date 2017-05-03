#' configDB
#'
#' Function responsible for configuring the global class that has the database information
#'
#' @param host (character) - host of server
#' @param port (character) - port of server
#' @param user (character) - database user
#' @param password (character) - database password
#' @param dbname (character) - database name
#'
#' @examples
#' configDB("localhost", "5432", "postgres", "", "db_accidents")
#' configDB("localhost", "5432", "postgres", "1234", "db_accidents")
#'
#' \dontrun{
#' configDB("", 5432, senha, "db_accidents")
#' configDB(local, 5432, postgres, 123, "db_accidents")
#' }
#'
#' @return Object with Information for connections
#'
#'@export
setGeneric(
  "configDB",
  def = function(host, port, user, password, dbname){
    standardGeneric("configDB")
  }
)

#' @method configDB rPostgis
#' @exportMethod configDB
#'
setMethod("configDB", c("character", "character", "character", "character", "character"), function(host, port, user, password, dbname){
  if(!is.null(host)){ x <- InfoDB(host=host) }
  if(!is.null(port)){ x <- InfoDB(port=port) }
  if(!is.null(user)){ x <- InfoDB(user=user) }
  if(!is.null(password)){ x <- InfoDB(password=password) }
  if(!is.null(dbname)){ x <- InfoDB(db=dbname) }

  return(x)
})

#' tb_dados (table of data for database test)
#'
#' usable this file(rPostigis/inst/extdata/tb_dados) in your database, for test package
#'
#' @name dataTest
#' @source http://www.testdata.com.br
#' @references acciddence of São Paulo (site)
NULL
