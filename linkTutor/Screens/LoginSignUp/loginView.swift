//
//  loginSignUpView.swift
//  linkTutor
//
//  Created by Vikashini G on 01/02/24.
//

import SwiftUI
import FirebaseAuth

struct loginView: View {
    
    @State private var email = ""
    @State private var password = ""

    @EnvironmentObject var viewModel : AuthViewModel
    
   
    var body: some View {
        NavigationView{
                VStack{
                    //Linktutor
                    VStack(alignment: .leading){
                        Text("LinkTutor")
                            .fontWeight(.bold)
                            .font(.system(size: 70).weight(.bold))
                            .fontDesign(.rounded)
                        Text("To find your next tutor")
                            .fontWeight(.bold)
                            .font(AppFont.mediumReg)
                            .foregroundColor(.accent)
                            .padding(.bottom,25)
                    }
//                    .offset(y: 60)
                    
                    //login and signup option
                    HStack{
                        VStack{
                            Text("Login")
                                .font(AppFont.mediumSemiBold)
                            Rectangle()
                                .frame(width: 100, height: 3)
                                .foregroundStyle(Color.accent)
                        }
                        Spacer()
                        VStack{
                            NavigationLink(destination: signUpView()){
                                Text("Sign up")
                                    .font(AppFont.mediumSemiBold)
                                    .foregroundColor(.text)
                            }
                            Rectangle()
                                .frame(width: 100, height: 3)
                                .foregroundStyle(Color.clear)
                        }
                    }
                    .padding(.horizontal, 50)
//                    .offset(y: 130)
                    
                    //login details
                    List{
                        VStack(alignment: .leading){
                            Text("Email address")
                                .font(AppFont.mediumReg)
                                .padding(.leading, 10)
                            TextField("Email addresss", text: $email)
                                .listRowBackground(Color.background)
                                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                .textFieldStyle(.plain)
                                .cornerRadius(8)
                                .padding(10)
                        }
                        .listRowBackground(Color.clear)
                        VStack(alignment: .leading){
                            Text("Password")
                                .font(AppFont.mediumReg)
                                .padding(.leading, 10)
                            SecureField("Password", text: $password)
                                .cornerRadius(8)
                                .padding(10)
                        }
                        .padding(.top)
                        .listRowBackground(Color.clear)
                    }
                    .padding(.top, 20)
//                    .offset(y: 150)
                    .listStyle(PlainListStyle())
                    
                    //button
                    Button {
                        Task {
                           try await viewModel.signIn(withEmail: email, password: password)
                        }
                        
                    } label :{
                        
                        Text("Login")
                            .font(AppFont.mediumSemiBold)
                            .foregroundColor(.black)
                    }
                    .frame(width: 250, height: 35)
                    .padding()
                    .disabled(!FormIsValid)
                    .opacity(FormIsValid ? 1.0 : 0.5)
                    .background(Color.accent)
                    .cornerRadius(50)
                    Spacer()
                }
                .padding()
                .background(Color.background)
                .environment(\.colorScheme, .dark)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    loginView()
}

extension loginView: AuthenticationFormProtocol {
    var FormIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
    }
}
    

