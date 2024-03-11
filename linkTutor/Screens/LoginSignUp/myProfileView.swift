//
//  myProfileView.swift
//  linkTutor
//
//  Created by Vikashini G on 31/01/24.
//

import SwiftUI

struct myProfileView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    @State var showEditView = false

    
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                HStack{
                    Text("My Profile")
                        .font(AppFont.largeBold)
                    Spacer()
                }
                
                
                
                HStack{
                    Image("dummyProfilePic")
                        .resizable()
                        .frame(width: 90, height: 90)
                        .cornerRadius(50)
                    Spacer()
                    
                    if let user = viewModel.currentUser {
                        VStack(alignment: .leading){
                            Text(user.fullName)
                                .font(AppFont.mediumSemiBold)
                                .foregroundStyle(Color.black)
                            Text(user.email)
                                .font(AppFont.actionButton)
                                .foregroundStyle(Color.black)
                        }
                        .padding(.trailing)
                    }
                    Spacer()
                    VStack{
                        Button(action: {
                            showEditView.toggle()
                        }) {
                            Image(systemName: "pencil")
                                .foregroundColor(.black)
                        }
                        .sheet(isPresented: $showEditView) {
                            ProfileInputView()
                        }
//                        NavigationLink(destination: ProfileInputView()){
//                            Image(systemName: "pencil")
//                                .foregroundColor(.black)
//                        }
                        Spacer()
                    }
                }
                .padding()
                .frame(width: 350, height: 120)
                .background(Color.accent)
                .cornerRadius(20)
                
                
                List{
                    HStack{
                        Text("Change password")
                       Spacer()
                        NavigationLink(destination : newPassword()){
                    
                        }
                    
                        
                       
                    }
                    .listRowBackground(Color.clear)
                    HStack{
                        Text("Delete my account")
                        Spacer()
                        Button{
                            viewModel.deleteAccount()
                        } label: {
                           
                            Image(systemName: "arrow.right")
                        }
                    }
                    .listRowBackground(Color.clear)
                   
                }
                .listStyle(PlainListStyle())
                .padding(.top)
                .frame(maxWidth: .infinity, maxHeight: 200,  alignment: .center)
                
                Spacer()
                HStack{
                    Spacer()
                    Button {
                        viewModel.signOut()
                    } label: {
                        Text("Logout")
                            .font(AppFont.mediumSemiBold)
                            .foregroundStyle(Color.text)
                            .frame(width: 200, height: 35)
                            .padding()
                            .background(Color.elavated)
                            .cornerRadius(50)
                    }
                    
                    Spacer()
                }
                //.frame(maxWidth: .infinity, alignment: .center)
                
                Spacer()
            }
            .padding()
            .background(Color.background)
        }
    }
}

#Preview {
    let viewModel = AuthViewModel()
          viewModel.currentUser = User(id: "mockUserID", fullName: "John Doe", email: "john@example.com")
          
          return myProfileView()
              .environmentObject(viewModel)
}


