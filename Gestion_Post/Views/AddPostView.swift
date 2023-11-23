import SwiftUI

struct AddPostView: View {
    @State private var isScrolling = false
    @State private var privacySelected = false
    @State private var title = ""
    @State private var description = ""

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
                                // Handle private option selection
                            }) {
                                Image(systemName: "lock")
                                Text("Private")
                                    .foregroundColor(.black)
                                
                            }
                            Button(action: {
                                // Handle public option selection
                            }) {
                                Image(systemName: "globe")
                                Text("Public")
                                    .foregroundColor(.black)
                            }
                            Button(action: {
                                // Handle friends only option selection
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
                    
                     ScrollView(.horizontal, showsIndicators: false){
                            LazyHStack(spacing: 16){
                    VStack(alignment: .leading, spacing: 0) {

                        HStack {
                            Button(action: {
                            }) {
                                Image("camera")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40,height: 40)
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
                        .frame(width: 140,alignment: .leading)
                        .padding(.top, 28)
                        HStack {
                            Button(action: {}, label: {
                                Image("video")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40,height: 40)
                                
                                })
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
                        .frame(width: 140,alignment: .leading)
                        .padding(.top, 28)
                        HStack {
                            Button(action: {}, label: {
                                Image(systemName: "tag.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40,height: 40)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                })
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
                        .frame(width: 140,alignment: .leading)
                        .padding(.top, 28)
                        HStack {
                            Button(action: {}, label: {
                                Image("music")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40,height: 40)
                                })
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
                        .frame(width: 140,alignment: .leading)
                        .padding(.top, 28)
                        HStack {
                            Button(action: {}, label: {
                                Image("feeling")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40,height: 40)
                            
                                })
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
                        .frame(width: 140,alignment: .leading)
                        .padding(.top, 28)
                        HStack {
                            Button(action: {}, label: {
                                Image("check")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40,height: 40)
                                })
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
                        .frame(width: 140,alignment: .leading)
                        .padding(.top, 28)
                                                
                    }
//                    .opacity(isScrolling ? 1 : 0)

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
                Spacer()
                Button(action: {
                    // Action for the "Post" button
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
        }
    }
}

struct AddPostView_Previews: PreviewProvider {
    static var previews: some View {
        AddPostView()
    }
}
