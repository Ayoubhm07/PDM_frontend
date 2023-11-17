import SwiftUI

struct PostView: View {
    @State private var posts: [Post] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(posts, id: \.id) { post in
                    PostCell(post : post)
                }
            }
            .navigationBarTitle("Posts")
            .onAppear {
                getAllPosts()
            }
        }
        
    }
    
    func getAllPosts() {
        guard let url = URL(string: "http://localhost:5004/api/posts/get-all-posts") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {	
                let decoder = JSONDecoder()
                // Assuming your response is an array of Post objects
                let posts = try decoder.decode([Post].self, from: data)
                
                // Update the state variable to refresh the view
                DispatchQueue.main.async {
                    self.posts = posts
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
