////
////  profileCard.swift
////  linkTutor
////
////  Created by Vikashini G on 31/01/24.
////
//
//import SwiftUI
//
//struct profileCard: View {
//    var personName: String
//    var personEmail: String
//    
//    var body: some View {
//        NavigationView{
//            HStack{
//                Image("dummyProfilePic")
//                    .resizable()
//                    .frame(width: 90, height: 90)
//                    .cornerRadius(50)
//                Spacer()
//                VStack(alignment: .leading){
//                    Text("\(personName)")
//                        .font(AppFont.mediumSemiBold)
//                        .foregroundStyle(Color.black)
//                    Text("\(personEmail)")
//                        .font(AppFont.actionButton)
//                        .foregroundStyle(Color.black)
//                }
//                .padding(.trailing)
//                
//                Spacer()
//                VStack{
//                    NavigationLink(destination: ProfileInputView()){
//                        Image(systemName: "pencil")
//                            .foregroundColor(.black)
//                    }
//                    Spacer()
//                }
//            }
//            .padding()
//            .frame(width: 350, height: 120)
//            .background(Color.accent)
//            .cornerRadius(20)
//            //.background(Color.white.opacity(0.5))
//            
//        }
//    }
//}
//
//#Preview {
//    profileCard(personName: "Fakie Nameiae", personEmail: "fake_email@gmail.com")
//}
