#' Obtener Geometrías
#' @description
#' La API permite la descarga de geometrías a través del formato ESRI Shapefile.
#' Está disponible en la versión GET de todos los recursos, con las excepción de
#' "direcciones" y "ubicacion".
#'
#'
#' @param id text Filtrar por ID.
#' @param interseccion Ej.:"municipio:moron"
#' @param nombre text Filtrar por Nombre.
#' @param provincia text Filtrar por nombre o ID de Provincia.
#' @param departamento text Filtrar por nombre o ID de Departamento.
#' @param municipio text Filtrar por nombre o ID de Municipio.
#' @param orden text Campo por el cual ordenar los resultados (por ID o nombre)
#' @param aplanar boolean Cuando está presente, muestra el resultado JSON con una estructura plana.
#' @param campos text Campos a incluir en la respuesta separados por comas, sin espacios. Algunos campos siempre serán incluidos, incluso si no se agregaron en la lista. Para incluir campos de sub-entidades, separar los nombres con un punto, por ejemplo: provincia.id.
#' @param max integer Cantidad máxima de resultados a devolver.
#' @param exacto boolean Cuando está presente, se activa el modo de búsqueda por texto exacto. Sólo tiene efecto cuando se usan campos de búsqueda por texto (por ejemplo, nombre).
#'
#' @importFrom purrr compact
#' @importFrom jsonlite fromJSON
#' @importFrom httr GET content
#' @export
#' @rdname get_localidades
#'
#' @return Un Data Frame con el listado de Departamentos
#' @examples
#' \dontrun{
#' get_localidades()
#' }
#
# get_geometrias <- function(recurso = NULL, interseccion = NULL, id = NULL, nombre = NULL, provincia = NULL, departamento = NULL, municipio = NULL, orden = NULL, aplanar = TRUE, campos = NULL, max = NULL, exacto = NULL){
#   args <- list(id = id, nombre = nombre, provincia = provincia, departamento = departamento, municipio = municipio, orden = orden, aplanar = aplanar, campos = campos, max = max, exacto = exacto)
#
#   check_internet()
#   base_url_get_geometrias <- paste0("https://apis.datos.gob.ar/georef/api/",recurso)
#   res <- GET(base_url_get_geometrias, query = compact(args))
#
#   check_status(res)
#
#   fromJSON(content(res, "text"))$localidades
# }
#
# recurso <- "calles"
#
# args <- list(id = NULL, nombre = NULL, provincia = NULL,
#              departamento = NULL, municipio = NULL, interseccion = "departamento:salta",
#              orden = NULL, aplanar = TRUE, campos = NULL, max = 1000, exacto = NULL, formato = "shp")
#
# base_url_get_geometrias <- paste0("https://apis.datos.gob.ar/georef/api/",recurso)
#
# res <- GET(base_url_get_geometrias, query = compact(args))
#
# ?GET()
# res2 <- GET("https://apis.datos.gob.ar/georef/api/departamentos?provincia=chaco&formato=shp&max=1000")
