import SwiftUI

struct PostView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(0 ... 10, id: \.self) { _ in
                        PostCell()
                    }
                }
                .padding(.top, 8)
            }
            .navigationBarTitle("Titre de votre vue", displayMode: .inline)
            .navigationBarItems(leading: Components.NavBarView())
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
