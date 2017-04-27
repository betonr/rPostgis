#' leinfo
#'
#' function responsible for validating informations,
#' search the results in the database and
#' plot one data graphic (bar) in the window
#'
#' @param \code{nome} (character) - user name
#' @param \code{local} (list character) - UF desired
#' @param \code{tempo} (int) - amount of previous days
#' @param \code{tipos} (character) - vehicle
#'
#' @examples
#' leinfo("Carlos Noronha", "SP", 2, "carros")
#' name <- "Carlos"
#' days <- 2
#' leinfo(name, "SP", days, "motos")
#'
#' \dontrun{
#' leinfo("Carlos Noronha", "SP", 2)
#' leinfo("Carlos Noronha", "SP", "carros")
#' leinfo("Carlos Noronha", 2, "carros")
#' leinfo("SP", 2, "carros")
#' }
#'
#' @export
setGeneric(
  name = "leinfo",
  def = function(nome, local, tempo, tipo){
    standardGeneric("leinfo")
  }
)

#' @method leinfo rPostgis
#' @exportMethod leinfo
#' @importFrom graphics barplot
#'
setMethod("leinfo", c("character","character","numeric","character"), function(nome, local, tempo, tipo){
  if(local != "SP" && local != "RJ" && local != "PR" && local != "MT"){
      stop("Só temos informações dos estados de SP - RJ - PR - MT")
    }
    if(tempo<1 || tempo>5){
      stop("A quantidade de dias pesquisados deve estar entre 1 e 5")
    }
    if(tipo!="carros" && tipo!="motos"){
      stop("Só temos pesquisas de carros e motos")
    }

    i<-0
    res <- c()
    listDate <- c()
    while(i<tempo){
      date <- format(Sys.Date()-i,"%Y-%m-%d")
      res[i+1] <- readDB(date, tipo, local)
      listDate[i+1] <- format(Sys.Date()-i,"%d")
      i <- i+1
    }

    barplot(res, names.arg = listDate, main = paste("Acidentes de",tipo,", ocorridos nos ultimos",tempo,"dias"), xlab = "Dias", ylab = "Quantidade de acidentes")

    print("Ação realizada com SUCESSO")
    }
)
