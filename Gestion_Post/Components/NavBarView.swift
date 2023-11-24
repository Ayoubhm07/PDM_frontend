//
//  NavBarView.swift
//  Gestion_Post
//
//  Created by Mac mini 8 on 9/11/2023.
//

import SwiftUI

struct NavBarView: View {
        
    
        var body: some View {
            NavigationView {
                VStack {
                    Text("Contenu de votre vue")
                }
                .navigationBarTitle("Titre de votre vue", displayMode: .inline)
                .navigationBarItems(leading: backButton, trailing: menuButton)
//                .toolbar{
//                    ToolbarItem(placement: .principal) {
//                                   ZStack {
//                                       Color(UIColor(red: 0.49, green: 0.78, blue: 0.64, alpha: 1.0))
//                                           .edgesIgnoringSafeArea(.all)
//                                         }
//                                    }
//            
//                       }
//                
            }
           
        }
        
        var backButton: some View {
            Button(action: {
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            }
        }
        
        var menuButton: some View {
            Button(action: {
            }) {
                Image(systemName: "ellipsis")
                    .foregroundColor(.black)
            }
        }
}

struct NavBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavBarView()
    }
}
