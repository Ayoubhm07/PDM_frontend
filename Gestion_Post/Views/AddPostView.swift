import SwiftUI
import Combine
import UIKit


struct AddPostView: View {
    @State private var isScrolling = false
    @State private var privacySelected = false
    
    @State private var title:String = ""
    @State private var description:String = ""
    @State private var selectedImage: Image?
    @State private var privacy: String = ""
    @State private var isRequesting = false
    
    @State private var isShowingImagePicker = false
    private let addPostURL = URL(string: "http://localhost:5004/api/posts/add-post")!
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Image("user")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Text("Ayoub")
                        .fontWeight(.medium)
                        .foregroundColor(Color.black)
                        .minimumScaleFactor(0.5)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 8)
                    
                    Spacer()
                    Button(action: {
                                       privacySelected.toggle()
                                   }) {
                                       HStack {
                                           Image(systemName: "lock.open.fill")
                                               .foregroundColor(.blue)
                                           Text("Privacy")
                                               .foregroundColor(.black)
                                           Image(systemName: privacySelected ? "chevron.up" : "chevron.down")
                                               .foregroundColor(.black)
                                       }
                                   }
                                   .padding(.top, 28)
                                   .padding(.horizontal, 28)
                                   
                    if privacySelected {
                          VStack(alignment: .leading, spacing: 8) {
                              Button(action: {
                                  privacy = "Private"
                                  privacySelected.toggle()
                              }) {
                                  Image(systemName: "lock")
                                  Text("Private")
                                      .foregroundColor(.black)
                              }
                              Button(action: {
                                  privacy = "Public"
                                  privacySelected.toggle()
                              }) {
                                  Image(systemName: "globe")
                                  Text("Public")
                                      .foregroundColor(.black)
                              }
                              Button(action: {
                                  privacy = "Friends Only"
                                  privacySelected.toggle()
                              }) {
                                  Image(systemName: "person.2")
                                  Text("Friends Only")
                                      .foregroundColor(.black)
                              }
                          }
                          .padding(.leading, 28)
                      }
                               
                }
                .frame(height: 45)
                .padding(.top, 100)
                .padding(.horizontal, 10)
            
                VStack (alignment: .leading, spacing: 0){
                    HStack {
                        TextField("Enter post title", text: $title)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding(.horizontal)
                                .padding(.top, 16)
                          
                    }
            
                    .padding(.top, 25)
                
                    
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer()
                    
                    TextField("What's on your mind ?", text: $description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        .padding(.top, 16)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack(alignment: .leading, spacing: 16) {
                            VStack(alignment: .leading, spacing: 1) {
                                HStack {
                                    Button(action: {
                                        isShowingImagePicker = true
                                    }) {
                                        Image("camera")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40)
                                    }
                                    .frame(width: 38, height: 38)
                                    .background(RoundedRectangle(cornerRadius: 12)
                                        .fill(Color.white))
                                    
                                    Text("Add Photo")
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.black)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 72, height: 38)
                                }
                                .frame(width: 140, alignment: .leading)
                                .padding(.top, 28)
                                
                                HStack {
                                    Button(action: {}) {
                                        Image("video")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40)
                                    }
                                    .frame(width: 38, height: 38)
                                    .background(RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white))
                                    
                                    Text("Add Video")
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.black)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 72, height: 38)
                                }
                                .frame(width: 140, alignment: .leading)
                                .padding(.top, 28)
                                
                                HStack {
                                    Button(action: {}) {
                                        Image(systemName: "tag.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40)
                                            .clipShape(Circle())
                                    }
                                    .frame(width: 38, height: 38)
                                    .background(RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white))
                                    
                                    Text("Tag People")
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.black)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 72, height: 38)
                                }
                                .frame(width: 140, alignment: .leading)
                                .padding(.top, 28)
                                
                                HStack {
                                    Button(action: {}) {
                                        Image("music")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40)
                                    }
                                    .frame(width: 38, height: 38)
                                    .background(RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white))
                                    
                                    Text("Music")
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.black)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 72, height: 38)
                                }
                                .frame(width: 140, alignment: .leading)
                                .padding(.top, 28)
                                
                                HStack {
                                    Button(action: {}) {
                                        Image("feeling")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40)
                                    }
                                    .frame(width: 38, height: 38)
                                    .background(RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white))
                                    
                                    Text("Feeling")
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.black)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 72, height: 38)
                                }
                                .frame(width: 140, alignment: .leading)
                                .padding(.top, 28)
                                
                                HStack {
                                    Button(action: {}) {
                                        Image("check")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 40, height: 40)
                                    }
                                    .frame(width: 38, height: 38)
                                    .background(RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white))
                                    
                                    Text("Check In")
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.black)
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 72, height: 38)
                                }
                                .frame(width: 140, alignment: .leading)
                                .padding(.top, 28)
                                
                            }
                        }
                        .padding()
                    }

                }
                
                            
                            // Convert the UIImage to Data
               // let imageData = $selectedImage.jpegData(compressionQuality: 0.8)
                                // Create a Post object with the selected image
                               // let post = Post(image: imageData.base64EncodedString())
                                
                                // Save the post to MongoDB
                               // savePostToMongoDB(post)
                           // }
                        	
                let post = Post(id: "", title: title, desc: description, image: " ", category: "", date: "Date"	, state: privacy)
                Button(action: {
                    addPost(post: post)
                }) {
                    HStack {
                        Text("Post")
                            .fontWeight(.medium)
                            .padding(.leading, 9)
                            .padding(.vertical, 6)
                            .foregroundColor(Color.white)
                            .minimumScaleFactor(0.5)
                            .multilineTextAlignment(.leading)
                            .background(RoundedRectangle(cornerRadius: 4)
                                .fill(Color.green))
                            .padding(.horizontal, 28)
                    }
                }
                .background(RoundedRectangle(cornerRadius: 4)
                    .fill(Color.green))
                .padding(.horizontal, 28)
                
            }
                .padding(.horizontal, 16)
                               .animation(.easeInOut)
                               .onAppear {
                                   isScrolling = false
                               }
                               .onDisappear {
                                   isScrolling = true
                               }
                }
                }
             
                
        }
    
  

func addPost(post: Post) {
    guard let url = URL(string: "http://localhost:5004/api/posts/add-post") else { return }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
    
    // Create a new dictionary to represent the request body
    let requestBody: [String: String] = [
        "title": post.title,
        "desc": post.desc,
        "image": post.image,
        "category": post.category,
        "date": post.date,
        "state": post.state
    ]
    
    do {
        let encodedRequestBody = try JSONEncoder().encode(requestBody)
        urlRequest.httpBody = encodedRequestBody
    } catch {
        print("Error encoding post data: \(error)")
        // Handle the post data encoding error (e.g., display an alert)
        return
    }
    
    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        if let data = data, let response = response as? HTTPURLResponse, response.statusCode == 201 {
            showSuccessAlert()
        } else {
            print("Error posting post: \(error?.localizedDescription ?? "Unknown error")")
            //  display an alert
        }
    }.resume()
}
func showSuccessAlert() {
    let alertController = UIAlertController(title: "Success", message: "Post added successfully!", preferredStyle: .alert)
    
    let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
        // Add any additional actions or code to be executed when the user taps "OK"
    }
    alertController.addAction(okAction)
    
    // Make sure to present the alert on the main queue
    DispatchQueue.main.async {
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: Image?
    @Environment(\.presentationMode) var presentationMode
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = Image(uiImage: uiImage)
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}

