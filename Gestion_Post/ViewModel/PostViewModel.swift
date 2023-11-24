//
//
//import Foundation
//import SwiftUI
//
//class PostViewModel: ObservableObject {
//    
//       @Published var posts: [Post] = []
//       @Published var showError: Bool = false
//       @Published var selectedPost: Post?
//
//       func getPosts() {
//           guard let url = URL(string: "http://localhost:5004/api/posts/get-all-posts") else { return }
//           
//           var urlRequest = URLRequest(url: url)
//           urlRequest.httpMethod = "GET"
//           
//           URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//               if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 {
//                   do {
//                       let jsonData = try JSONDecoder().decode(posts.self, from: data)
//                       DispatchQueue.main.async {
//                           self.homes = jsonData.homes
//                       }
//                   } catch {
//                       print("Error decoding JSON: \(error)")
//                       self.showError = true
//                   }
//               } else {
//                   print("Error fetching posts: \(error?.localizedDescription ?? "Unknown error")")
//                   self.showError = true
//               }
//           }.resume()
//       }
//       
//
//    
   
//
//
//      

//
