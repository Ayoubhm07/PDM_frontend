import Foundation
struct Post: Identifiable,Codable {
    var id: String
    var title: String
    var desc: String
    var image: String
    var category: String
    var date: String
    var state: String
    
    init(id: String, title: String, desc: String, image: String, category: String, state: String) {
        self.id = id
        self.title = title
        self.desc = desc
        self.image = image
        self.category = category
        self.date = Date().description // Utilise la date actuelle
        self.state = state
    }

}
