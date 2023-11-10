import SwiftUI

struct ContentView: View {
    @State var selectedTaB: String = "square.grid.3*3"
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    @State var topHeaderOffset: CGFloat = 0
    
    var body: some View {
        //        NavigationView {
        //            Text("Your content view goes here")
        //                .navigationBarTitle("Profile", displayMode: .inline )
        //                .onAppear{
        //                    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        //                }
        //        }
        //    }
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
                        Image("logo")
                            .resizable()
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
                        Text("Following")
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
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 15){
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            VStack{
                                Image(systemName: "plus")
                                    .font(.title2)
                                    .foregroundColor(.primary)
                                    .padding(18)
                                    .background(Circle().stroke(Color.gray))
                                Text("New")
                                    .foregroundColor(.primary)
                            }
                        })
                    }
                    .padding([.horizontal, .top])
                })
            }
        })
    }
    
    //extension UIColor {
    //    convenience init(hex: String) {
    //        let scanner = Scanner(string: hex)
    //        scanner.scanLocation = 1 // Skip the '#' character
    //        var rgbValue: UInt64 = 0
    //        scanner.scanHexInt64(&rgbValue)
    //
    //        let r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
    //        let g = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
    //        let b = CGFloat(rgbValue & 0x0000FF) / 255.0
    //
    //        self.init(red: r, green: g, blue: b, alpha: 1.0)
    //    }
    //}
    //
    //struct ContentView_Previews: PreviewProvider {
    //    static var previews: some View {
    //        ContentView()
    //    }
    //}
    
}
#Preview {
    ContentView()
}
