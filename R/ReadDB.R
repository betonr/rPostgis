setGeneric(
  "readDB",
  def = function(date, type, uf){
    standardGeneric("readDB")
  }
)

setMethod("readDB", c("character", "character", "character"), function(date, type, uf){
  require(RPostgreSQL)
  con<-NULL
  if(is.null(con)){
    driver <- dbDriver(InfoDB()@accessDriver)
    con <- dbConnect(driver, host = InfoDB()@host, port = InfoDB()@port,
                     user = InfoDB()@user, password = InfoDB()@password,
                     dbname=InfoDB()@db
    )
  }
  on.exit(dbDisconnect(con))

  sql <- sprintf("SELECT * FROM tb_dados WHERE type='%s' AND date='%s' AND uf='%s'",type,date,uf)
  res <- dbGetQuery(con, sql)
  numR <- nrow(res)+0

  return(numR)
  }
)
