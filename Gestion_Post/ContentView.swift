import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
                    VStack {
                        NavigationLink(destination: AddPostView()) {
                            Text("Ajouter un post")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                        
                        NavigationLink(destination: PostView()) {
                            Text("Voir les posts")
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                        
                        // Autres contenus de votre ContentView
                        
                    }
                    .navigationTitle("Contenu de votre vue")
                    .onAppear {
                        requestNotificationAuthorization()
                    }
                }
    }
}
#Preview {
    ContentView()
}
