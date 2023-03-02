import Foundation

public class UrlRequest {
    
    public init() {}
    
    public func getData(urlRequest: String, nameCard: String) {
            let urlRequest = URL(string: urlRequest)
            guard let url = urlRequest else { return }
            print("Ссылка действительна - ожидание ответа")
            
        URLSession.shared.dataTask(with: url) { [self] data, response, error in
                if error != nil {
                    print(NetworkError.badURL.localizedDescription)
                } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                    print("Ответ получен - статус кода \(response.statusCode)")
                    guard let data = data else {
                        return print(NetworkError.transportError.localizedDescription)
                        
                    }
                    
                    let json = try? JSONDecoder().decode(Users.self, from: data)
                    guard let json = json else {
                        return print(NetworkError.badJSON.localizedDescription)
                    }
                    printResult(for: json, nameCard: nameCard)
            }
        }.resume()
    }
    
    func printResult(for cards: Users, nameCard: String) {
        for card in cards.cards where card.name == nameCard {
            print("Имя карты: \(card.name)")
            print("Тип: \(card.type)")
            print("Мановая стоимость: \(card.manaCost ?? "отсутствует")")
            print("Название сета : \(card.setName) \n")
        }
    }
}


