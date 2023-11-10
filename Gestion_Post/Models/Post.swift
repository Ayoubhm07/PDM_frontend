import Foundation
struct Post: Identifiable,Codable {
    var id: String
    var desc: String
    var likes: Int
    var comments: Int
}
