
//
//  TabView.swift
//  Gestion_Post
//
//  Created by TuniC on 7/11/2023.
//

import SwiftUI

struct ProfileTabView: View {
    var body: some View {
        TabView {
            
            Text("Search")
                .tabItem { Image(systemName: "magnifyingglass") }
            Text("Upload Post")
                .tabItem { Image(systemName: "plus.square") }
            Text("Profile")
                .tabItem { Image(systemName: "person") }
            Text("Reclamation")
                .tabItem { Image(systemName: "bicycle") }
            Text("Reservation")
                .tabItem { Image(systemName: "exclamationmark.circle") }
        }
        .accentColor(.green)
    }
    
}

struct ProfileTabView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTabView()
    }
}
