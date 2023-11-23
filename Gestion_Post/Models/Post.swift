import Foundation
struct Post: Identifiable,Codable {
    var id: String
    var tite: String
    var desc: String
    var image: String
    var category: String
    var date: Date
    var state: String
}
