#'@title create xml document from endpoint
#'@description This function takes an endpoint, determines if its local or web-based and returns an xml doc
#'
#' Title
#'
#' @param serviceEndpoint 
#' 
#' @return XML document
#' @import XML
#' @import httr
#' @export
#'
#' @examples
#'serviceEndpoint  <- paste0('https://cida.usgs.gov/coastalhazards/csw/?',
#''service=CSW&request=GetRecordById&version=2.0.2&typeNames=fgdc:metadata',
#''&id=urn:uuid:12d6c1ee-a9e6-11e3-99f6-0050569524e0&',
#''outputSchema=http://www.opengis.net/cat/csw/csdgm&elementSetName=full')
#'doc <- grabXML(serviceEndpoint)

grabXML = function(serviceEndpoint){
  
  #if xml
  checkhttp <- substr(serviceEndpoint, 0, 4)
  if (!grepl("http", checkhttp)) {
    
    doc <- xmlInternalTreeParse(serviceEndpoint)
    
  }#if http 
  else {
    
    doc <- GET(serviceEndpoint)$content
    doc <- rawToChar(doc)
    doc <- xmlInternalTreeParse(doc)
    
  } 
  
  return(doc)
  
}