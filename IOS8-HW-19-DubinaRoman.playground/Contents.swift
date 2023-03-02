import Foundation

let urlRequest = UrlRequest()
var nameCard = "Black Lotus"


var components = URLComponents()
components.scheme = "https"
components.host = "api.magicthegathering.io"
components.path = "/v1/cards"
components.queryItems = [URLQueryItem(name: "name", value: "Black Lotus")]

urlRequest.getData(urlRequest: components.string!, nameCard: nameCard)

components.queryItems = [URLQueryItem(name: "name", value: "Opt")]
nameCard = "Opt"
urlRequest.getData(urlRequest: components.string!, nameCard: nameCard)
