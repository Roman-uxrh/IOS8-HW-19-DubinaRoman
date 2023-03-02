import UIKit

struct Users: Decodable {
    var cards: [Card]
}

struct Card: Decodable {
    let name: String
    let manaCost: String?
    let type: String
    let setName: String
}

var users = Users(cards: [])

func getData(urlRequest: String) {
        let urlRequest = URL(string: urlRequest)
        guard let url = urlRequest else { return }
        print("Ссылка действительна - ожидание ответа")
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print((error?.localizedDescription)!)
            } else if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                print("Ответ получен - статус кода \(response.statusCode)")
                guard let data = data else { return }
                
//                let dataAsString = String(data: data, encoding: .utf8)
//                print(dataAsString ?? "данных нет")
                
                let cards = try? JSONDecoder().decode(Users.self, from: data)
        }
    }.resume()
}

let url = "https://api.magicthegathering.io/v1/cards?name=Black%20Lotus"
getData(urlRequest: url)

