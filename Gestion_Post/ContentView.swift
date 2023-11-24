import SwiftUI

@available(iOS 17.0, *)
struct ContentView: View {
    var body: some View {
        NavigationView {
                    VStack {
                        NavigationLink(destination: LocationView()) {
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

@available(iOS 17.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
