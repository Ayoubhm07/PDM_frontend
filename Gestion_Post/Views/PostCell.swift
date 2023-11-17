//
//  PostCell.swift
//  Gestion_Post
//
//  Created by TuniC on 7/11/2023.
//

import SwiftUI
import UserNotifications
import CoreLocation
struct PostCell: View {
    @State private var isMenuVisible = false
    @State private var isCommentSheetVisible = false
    @State private var isUserListVisible = false
    @State private var locationManager = CLLocationManager()
    @State private var postIDToUpdate: String?
	
   @State var post: Post
    var body: some View {
        
       
        VStack {
                    HStack {
                        Image("user")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                        
                        Text("Ayoub")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        Button {
                            isMenuVisible.toggle()
                        } label: {
                            Image(systemName: "ellipsis")
                                .imageScale(.large)
                        }
                        .foregroundColor(.green)
                        .padding(.trailing, 8)
                        .actionSheet(isPresented: $isMenuVisible) {
                            ActionSheet(title: Text(""), buttons: [
                                .destructive(Text("Delete Post"), action: {
                                    deletePost(postID: post.id)
                                }),
                                .default(Text("Update Post"), action: {
                                    postIDToUpdate = post.id
                                       navigateToUpdatePostView(postID: post.id) }),
                                        .cancel()
                            ])
                        }
                    }
            .padding(.leading, 8)
            
            
                       
            Text(post.title)
                    .font(.headline)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    .background(Color(red: 124/255, green: 200/255, blue: 162/255))                     .foregroundColor(.white)
            
            Image("user")
                .resizable()
                .scaledToFit()
                .frame(height: 400)
                .clipShape(Rectangle())
            
            
            HStack(spacing:16){
                Button(action: {
                    locationManager.requestWhenInUseAuthorization()
                    showLocationNotification()
                }) {
                    Image(systemName: "location.circle")
                        .imageScale(.large)
                }
            
                Button {
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
               
                Button {
                    isCommentSheetVisible.toggle()
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button {
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
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .onTapGesture {
                                    isUserListVisible = true
                                }
                .sheet(isPresented: $isUserListVisible) {
                            UserListView()
                        }
            
            HStack{
                Text("Ayoub").fontWeight(.semibold)
                Text("OYOYOYOYOY")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            Text("5h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)
        }
        .sheet(isPresented: $isCommentSheetVisible) {
            CommentListView()
        }
    }
}


struct UserListView: View {
    let users: [String] = ["user1", "user2", "user3", "user4", "user5", "user6", "user7", "user8", "user9", "user10", "user11", "user12", "user13", "user14", "user15"]

    var body: some View {
        VStack {
            Text("Liste des utilisateurs qui ont aimé ce post")
                .font(.headline)
                .padding()
            
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(users, id: \.self) { user in
                        UserRowView(user: user)
                    }
                }
            }
            
            Spacer()
            
            Button {
                // Action à effectuer lors de la fermeture de la liste des utilisateurs
            } label: {
                Text("Fermer")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }
}

func showLocationNotification() {
    let center = UNUserNotificationCenter.current()
    let content = UNMutableNotificationContent()
    content.title = "Votre position"
    content.body = "Latitude: 40.7128, Longitude: -74.0060"
    content.sound = UNNotificationSound.default
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
    
    let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
    center.add(request) { error in
        if let error = error {
            print("Erreur lors de l'ajout de la notification : \(error)")
        }
    }
}

struct UserRowView: View {
    var user: String
    
    var body: some View {
        HStack {
            Image("user")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text(user)
                .font(.headline)
            
            Spacer()
            
            Button(action: {
                // Action pour ajouter l'ami
            }) {
                Text("Add Friend")
                    .font(.footnote)
                    .foregroundColor(.green)
            }
        }
        .padding(.horizontal)
    }
}


struct CommentListView: View {
    @State private var userComment = ""

    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button {
                    // Action pour ajouter le commentaire
                } label: {
                    Text("Add Comment")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding()
            }
            
            ScrollView {
                VStack(spacing: 8) {
                    ForEach(0..<10) { index in
                        CommentRowView(comment: "Commentaire \(index + 1)")
                        Spacer()
                    }
                }
            }
            
            HStack {
                Image("user")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                TextField("Votre commentaire", text: $userComment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button {
                    // Action pour ajouter le commentaire de l'utilisateur
                } label: {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.green)
                        .font(.headline)
                        .padding(.horizontal)
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
    }
}
                                         func navigateToUpdatePostView(postID: String) {
                                             // Utilisez votre méthode de navigation préférée pour accéder à la page UpdatePostView
                                             // Assurez-vous d'avoir une vue correspondante pour UpdatePostView dans votre code.

                                             // Exemple avec NavigationLink :
                                             NavigationLink(destination: UpdatePostView(postID: postID)) {
                                                 EmptyView()
                                             }
                                         }

func deletePost(postID: String) {
    guard let url = URL(string: "http://localhost:5004/api/posts/delete-post") else {
        print("Invalid URL")
        return
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let parameters: [String: Any] = [
        "postId": postID
    ]
    
    guard let jsonData = try? JSONSerialization.data(withJSONObject: parameters)
    
    else {
        print("Failed to serialize JSON data")
        return
    }
    
    request.httpBody = jsonData
    
    URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error)")
            return
        }
        
        guard let response = response as? HTTPURLResponse else {
            print("Invalid response")
            return
        }
        
        if response.statusCode == 200 {
            // Post deleted successfully
            DispatchQueue.main.async {
                // Update your local data or UI if needed
            }
        } else {
            print("Failed to delete post. Status code: \(response.statusCode)")
        }
        if response.statusCode == 200 {
                   // Post deleted successfully
                   DispatchQueue.main.async {
                       SuccessDAlert()
                   }
               } else {
                   print("Failed to delete post. Status code: \(response.statusCode)")
               }
    }.resume()
}

func SuccessDAlert() {
    let alertController = UIAlertController(title: "Success", message: "Post Deleted successfully!", preferredStyle: .alert)
    
    let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
        // Add any additional actions or code to be executed when the user taps "OK"
    }
    alertController.addAction(okAction)
    
    // Make sure to present the alert on the main queue
    DispatchQueue.main.async {
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}

struct CommentRowView: View {
    var comment: String
    
    var body: some View {
        HStack {
            Image("user")
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("Nom de l'utilisateur")
                    .font(.headline)
                Text(comment)
                    .font(.body)
            }
            
            Spacer()
        }
        .padding(.horizontal)
    }
}



struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        // Create an instance of Post and pass it to PostCell
        let samplePost = Post(id: "", title: "SELKEEEEEEEEEET", desc: "", image: " ", category: "", date: ""    , state: "")
        return PostCell(post: samplePost)
    }
}

