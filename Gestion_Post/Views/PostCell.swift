//
//  PostCell.swift
//  Gestion_Post
//
//  Created by TuniC on 7/11/2023.
//

import SwiftUI

struct PostCell: View {
    var body: some View {
        VStack{
            HStack{
                Image("user")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40,height: 40)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Text("Ayoub")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.leading, 8)
            
            Image("event1")
                .resizable()
                .scaledToFit()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            
            HStack(spacing:16){
                Button{
                    print("Like Post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                
                Button{
                    print("Comment On Post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button{
                    print("Share Post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()
            }
            .padding(.leading,8)
            .padding(.top,4)
            .foregroundColor(.green)
            
            Text("45 likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            HStack{
                Text("Ayoub").fontWeight(.semibold)
                Text("OYOYOYOYOY")
                
                    
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            Text("5h ago")
                .font(.footnote)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)
        }
    }
}
    #Preview {
        PostCell()
    }

