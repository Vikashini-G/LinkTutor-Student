//import SwiftUI
//
//struct LoginView: View {
//    @State private var username = ""
//    @State private var password = ""
//    @State private var isLoginButtonDisabled = true
//    @State private var isLoggedIn = false // Track login state
//    @State private var isActive: Bool = false // Track navigation state
//    @State private var isLoggingIn = false // Track login process
//    
//    var body: some View {
//        ZStack{
//            VStack {
//                ZStack{
////                    RoundedRectangle(cornerRadius: 30, style: .continuous)
////                        .fill(Color.accent) // Use the color you want for the rounded rectangle
////                        .frame(height:300) // Set the height you want for the rounded rectangle
//                    
//                    VStack(alignment: .center){
//                        
//                        Text("LinkTutor")
//                            .fontWeight(.bold)
//                            .font(.system(size: 70).weight(.bold))
//                            .fontDesign(.rounded)
//                            .foregroundColor(.maroonRed)
//                            
//                        
//                        Text("To find your next tutor")
//                            .fontWeight(.bold)
//                            .font(AppFont.smallReg)
//                            .foregroundColor(.maroonRed)
//                            .padding(.bottom,25)
//                        
//                        HStack{
//                            Button(action: {
//                                // Add your SignUp action here
//                                print("Login Tapped!")
//                            }) {
//                                Text("Login")
//                                    .fontWeight(.bold)
//                                    .font(AppFont.smallReg)
//                                    .foregroundColor(.maroonRed)
//                            }
//                            .disabled(isLoggingIn) // Disable the button while logging in
//                            .overlay(
//                                Group {
//                                    if isLoggingIn {
//                                        ProgressView() // Show an activity indicator while logging in
//                                    }
//                                }
//                            )
//                            
//                            Spacer()
//                            
//                            Button(action: {
//                                // Add your SignUp action here
//                                print("SignUp Tapped!")
//                            }) {
//                                Text("SignUp")
//                                    .fontWeight(.bold)
//                                    .font(AppFont.smallReg)
//                                    .foregroundColor(.maroonRed)
//                            }
//                        }
//                        .padding([.leading, .trailing], 70)
//                        .padding(.top,80)
//                        
//                    }
//                }
//                
//                TextField("Username", text: $username)
//                    .padding()
//                    .background(Color(UIColor.systemGray5))
//                    .cornerRadius(8)
//                    .padding(10)
//                
//                SecureField("Password", text: $password)
//                    .padding()
//                    .background(Color(UIColor.systemGray5))
//                    .cornerRadius(8)
//                    .padding(10)
//                
//                Button(action: {
//                    // Add your login authentication logic here
//                    // For simplicity, this example always considers login successful
//                    isLoggingIn.toggle()
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                        // Simulate a delay for the login process
//                        isLoggedIn = true
//                        isLoginButtonDisabled.toggle()
//                        isActive = true
//                        isLoggingIn.toggle()
//                    }
//                }) {
//                    Text("Login")
//                        .frame(width: 200, height:15)
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                        .shadow(color: .black.opacity(0.1), radius: 10 , x: 0 , y: 12)
//                }
//                .disabled(isLoginButtonDisabled || isLoggingIn) // Disable the button while logging in
//                .overlay(
//                    Group {
//                        if isLoggingIn {
//                            ProgressView() // Show an activity indicator while logging in
//                        }
//                    }
//                )
//                
//                Spacer()
//            }
//            .background(
//                VStack{
//                    accentClassViewHeader()
//                        .edgesIgnoringSafeArea(.top)
//                        .offset(y: -150)
//                    Spacer()
//                }
//            )
//            .background(Color.background)
//            .navigationTitle("Login")
//        }
//    }
//}
//
//struct HomeView: View {
//    var body: some View {
//        Text("Welcome to the Home Page!")
//            .navigationBarTitle("Home", displayMode: .inline)
//    }
//}
//
//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
