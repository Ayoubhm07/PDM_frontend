//
//  PostView.swift
//  Gestion_Post
//
//  Created by TuniC on 7/11/2023.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption = ""
    @State private var imagePickerPresented = false
    @State private var photoItem: PhotosPickerItem?
    var body: some View {
        VStack{
        
            HStack{
                Button{
                    print("cancel upload")
                } label: {
                    Text("Cancel")
                }
                Spacer()
                
                Text("New Post")
                    .fontWeight(.semibold)
                Spacer()
                Button{
                    print("upload")
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            HStack(spacing: 8){
                Image("velo")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                TextField("Enter your caption", text: $caption,axis: .vertical)
            }
            .padding()
            Spacer()
        }
        .onAppear{
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $photoItem)
    }
}

#Preview {
    UploadPostView()
}
