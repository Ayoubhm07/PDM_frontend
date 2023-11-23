import SwiftUI


struct ContentView: View {
    var body: some View {
        Text("Contenu de votre vue")
            .onAppear {
                requestNotificationAuthorization()
            }
    }
}
#Preview {
    ContentView()
}
