//import SwiftUI
//
//struct SignUpView: View {
//    @State private var username = ""
//    @State private var password = ""
//    @State private var isSignUpButtonDisabled = true
//    @State private var isSigningUp = false // Track sign-up process
//    @State private var isStudent = false
//    @State private var isTeacher = false
//    
//    var body: some View {
//        ZStack{
//            Color(.background)
//                .edgesIgnoringSafeArea(.all)
//                
//            VStack {
//                ZStack{
//                    RoundedRectangle(cornerRadius: 30, style: .continuous)
//                        .fill(Color.accent) // Use the color you want for the rounded rectangle
//                        .frame(height: 300) // Set the height you want for the rounded rectangle
//                    
//                    VStack(alignment: .center){
//                        
//                        Text("LinkTutor")
//                            .fontWeight(.bold)
//                            .font(.system(size: 70).weight(.bold))
//                            .fontDesign(.rounded)
//                            .foregroundColor(.maroonRed)
//                        
//                        Text("To find your next tutor")
//                            .fontWeight(.bold)
//                            .font(AppFont.smallReg)
//                            .foregroundColor(.maroonRed)
//                            .padding(.bottom, 25)
//                        
//                        HStack {
//                            Button(action: {
//                                // Add your Login action here
//                                print("Login Tapped!")
//                            }) {
//                                Text("Login")
//                                    .fontWeight(.bold)
//                                    .font(AppFont.smallReg)
//                                    .foregroundColor(.maroonRed)
//                            }
//                            .overlay(
//                                Group {
//                                    if isSigningUp {
//                                        ProgressView() // Show an activity indicator while signing up
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
//                                Text("Sign Up")
//                                    .fontWeight(.bold)
//                                    .font(AppFont.smallReg)
//                                    .foregroundColor(.maroonRed)
//                            }
//                            .disabled(isSigningUp) // Disable the button while signing up
//                        }
//                        .padding([.leading, .trailing], 70)
//                        .padding(.top, 50)
//                        
//                    }
//                }
//                .edgesIgnoringSafeArea(.top)
//                
//                TextField("First Name", text: $username)
//                    .padding()
//                    .background(Color(UIColor.systemGray5))
//                    .cornerRadius(8)
//                    .padding(10)
//                
//                TextField("Last Name", text: $username)
//                    .padding()
//                    .background(Color(UIColor.systemGray5))
//                    .cornerRadius(8)
//                    .padding(10)
//                
//                TextField("Email", text: $username)
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
//                HStack {
//                    Button(action: {
//                        isTeacher = true
//                    }) {
//                        Image(systemName: isTeacher ? "graduationcap.fill" : "graduationcap")
//                            .resizable()
//                            .clipped()
//                            .frame(width: 75, height: 75)
//                            .foregroundColor(.black)
//                            
//                        }
//                        .padding()
//                        
//                                        
//                        Button(action: {
//                        isStudent = true
//                    }) {
//                        Image(systemName: isStudent ? "person.fill" : "person")
//                            .resizable()
//                            .clipped()
//                            .frame(width: 75, height: 75)
//                            .foregroundColor(.black)
//                        }
//                        .padding()
//                    }
//                
//                Button(action: {
//                    // Add your sign-up authentication logic here
//                    // For simplicity, this example always considers sign-up successful
//                    isSigningUp.toggle()
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                        // Simulate a delay for the sign-up process
//                        isSigningUp.toggle()
//                    }
//                }) {
//                    Text("Sign Up")
//                        .frame(width: 200, height: 15)
//                        .padding()
//                        .background(Color.blue)
//                        .foregroundColor(.white)
//                        .cornerRadius(10)
//                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 12)
//                }
//                .disabled(isSignUpButtonDisabled || isSigningUp) // Disable the button while signing up
//                .overlay(
//                    Group {
//                        if isSigningUp {
//                            ProgressView() // Show an activity indicator while signing up
//                        }
//                    }
//                )
//                
//                Spacer()
//            }
//            .navigationTitle("Sign Up")
//        }
//    }
//}
//
//#Preview {
//    SignUpView()
//}
