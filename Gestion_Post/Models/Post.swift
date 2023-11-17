import Foundation
struct Post: Identifiable,Codable {
    var id: String
    var title: String
    var desc: String
    var image: String
    var category: String
    var date: String
    var state: String
}
