//
//  newPassword.swift
//  linkTutor
//
//  Created by Aditya Pandey on 07/03/24.
//

import SwiftUI

struct newPassword: View {
    @State private var password = ""
    @State private var confirmPassword = ""
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
        VStack {
         
            List {
                
                VStack(alignment: .leading){
                    Text("Password")
                        .font(AppFont.mediumReg)
                    SecureField("Password", text: $password)
                        .cornerRadius(8)
                }
                .padding(.top)
                .listRowBackground(Color.clear)
                
                VStack(alignment: .leading){
                    
                    Text("Confirm Password")
                        .font(AppFont.mediumReg)
                    ZStack(alignment : .trailing) {
                        SecureField("Password", text: $confirmPassword)
                            .cornerRadius(8)
                        
                        if !password.isEmpty && !confirmPassword.isEmpty {
                            if password == confirmPassword {
                                Image(systemName: "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemGreen))
                            } else {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color(.systemRed))
                            }
                        }
                    }
                }
                .padding(.top)
                .listRowBackground(Color.clear)
            }
            VStack {
                Button {
                    Task {
                        viewModel.changePassword(password: password)
                    }
                
                } label : {
                    Text("Submit")
                        .font(AppFont.mediumSemiBold)
                        .foregroundColor(.black)
                }
                .frame(width: 250, height: 35)
                .padding()
                .disabled(!FormIsValid)
                .opacity(FormIsValid ? 1.0 : 0.5)
                .background(Color.blue)
                .cornerRadius(50)
            }
            Spacer()
        }
    }
}

#Preview {
    newPassword()
}


extension newPassword: AuthenticationFormProtocol {
    var FormIsValid: Bool {
        return !password.isEmpty
        && password.count > 5
        && password == confirmPassword
    }
}
