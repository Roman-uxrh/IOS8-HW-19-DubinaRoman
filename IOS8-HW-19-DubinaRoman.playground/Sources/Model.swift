import Foundation

public struct Users: Decodable {
    var cards: [Card]
}

public struct Card: Decodable {
    let name: String
    let manaCost: String?
    let type: String
    let setName: String
}
