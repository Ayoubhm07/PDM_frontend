//
//  ProfileView.swift
//  Gestion_Post
//
//  Created by TuniC on 7/11/2023.
//

import SwiftUI

struct ProfileView: View {
    @State var selectedTaB: String = "square.grid.3*3"
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    @State var topHeaderOffset: CGFloat = 0
    let images = ["user", "user", "user", "user", "user", "user", "user", "image8", "user"]
    
    var body: some View {
      
        VStack{
            HStack(spacing: 15){
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("AYOUB")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.primary)
                })
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "plus.app")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.primary)
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "line.horizantal.3")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.primary)
                })
            }
            .padding([.horizontal,.top])
        }
        ScrollView(.vertical,showsIndicators: false,content: {
            
            LazyVStack(pinnedViews: [.sectionHeaders]){
                Divider()
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Image("user")
                            .resizable()
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 70, height: 70)
                            .overlay(
                                Image(systemName: "plus")
                                    .foregroundColor(.white)
                                    .padding(6)
                                    .background(Color.green)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .offset(x: 5, y:5)
                                ,alignment: .bottomTrailing)
                    })
                    VStack{
                        Text("675")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.primary)
                        Text("Posts")
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    
                    VStack{
                        Text("119")
                            .font(.title2)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(.primary)
                        Text("Friends")
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }
                .padding()
                VStack(alignment: .leading,spacing: 4, content: {
                    Text("Ayoub . DEV")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.primary)
                    Text("Video Creator")
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    Text("wiiiiiiiiw")
                    Link(destination: URL(string: "https.ayoub.com")!, label: {
                        Text("ayoub s mobile application")
                    })
                })
                .padding(.horizontal)
                HStack(spacing: 10){
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Edit Your Profle")
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .padding(.vertical,10)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.gray)
                            )
                    })
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Add Tools")
                            .fontWeight(.semibold)
                            .foregroundColor(.primary)
                            .padding(.vertical,10)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.gray)
                            )
                    })
                }
                .padding([.horizontal, .top])
                
                ScrollView(.vertical, showsIndicators: false) {
                         HStack(spacing: 15) {
                             VStack {
                                 Button(action: {}) {
                                     VStack {
                                         Image(systemName: "plus")
                                             .font(.title2)
                                             .foregroundColor(.primary)
                                             .padding(18)
                                             .background(Circle().stroke(Color.gray))
                                         Text("New")
                                             .foregroundColor(.primary)
                                     }
                                 }
                             }
                             
                             ForEach(images, id: \.self) { imageName in
                                 Image(imageName)
                                     .resizable()
                                     .scaledToFill()
                                     .frame(width: 100, height: 100)
                                     .cornerRadius(8)
                             }
                         }
                         .padding()
                     }
                 }
                }
            )
        }
    }
    
    



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        return ProfileView()
    }
}

