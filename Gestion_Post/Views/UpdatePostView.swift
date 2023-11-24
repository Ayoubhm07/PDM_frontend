//
//  UpdatepostView.swift
//  Gestion_Post
//
//  Created by Mac mini 8 on 9/11/2023.
//

import SwiftUI

struct UpdatePostView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var updatedTitle = ""
    @State private var updatedDescription = ""
    @State private var updatedImage = ""
    @State private var updatedCategory = ""
    @State private var showAlert = false
    var postID: String
    
    var body: some View {
        VStack {
            TextField("Title", text: $updatedTitle)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Description", text: $updatedDescription)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Image", text: $updatedImage)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Category", text: $updatedCategory)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: updatePost) {
                Text("Update")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .padding()
        .navigationBarTitle("Update Post")
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Update Successful"), message: Text("Post updated successfully"), dismissButton: .default(Text("OK")) {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    func updatePost() {
        // Prepare the payload to send to the server
        let payload: [String: Any] = [
            "postId": postID,
            "payload": [
                "title": updatedTitle,
                "desc": updatedDescription,
                "image": updatedImage,
                "category": updatedCategory
            ]
        ]
        
        // Create a URLRequest with the endpoint URL
        guard let url = URL(string: "https://your-api-endpoint.com/edit-post") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Set the request body data as JSON
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: payload, options: [])
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            print("Error serializing JSON: \(error)")
            return
        }
        
        // Send the request
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Handle the response
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            if let data = data, let responseString = String(data: data, encoding: .utf8) {
                print("Response: \(responseString)")
                DispatchQueue.main.async {
                    showAlert = true
                }
            }
        }.resume()
    }
    
}

struct UpdatePostView_Previews: PreviewProvider {
    static var previews: some View {
        return UpdatePostView(postID: "1223")
    }
}
