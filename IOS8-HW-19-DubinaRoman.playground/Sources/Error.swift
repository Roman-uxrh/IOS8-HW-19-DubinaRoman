import Foundation

public enum NetworkError: Error, LocalizedError {
    case transportError
    case badURL
    case badJSON
    case serverError
}
