//
//  RequestSentCard.swift
//  linkTutor
//
//  Created by Aditya Pandey on 13/03/24.
//

import SwiftUI

struct RequestSentCard: View {
    var teacherName : String
    var phoneNumber : Int
    var id : String
    var className : String
    @State var showingUpdateCourse = false
//    @EnvironmentObject var viewModel: AuthViewModel
    @ObservedObject var viewModel = RequestListViewModel()
    
    
    var body: some View{
        NavigationStack{
            
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        Text("\(teacherName)")
                            .font(AppFont.mediumSemiBold)
                        Spacer()
                        Button(action: {
                            // Delete button action
                            viewModel.deleteEnrolled(id: id)
                            
                        }) {
                            Image(systemName: "trash.fill")
                                .font(.system(size: 17))
                                .foregroundColor(.red)
                        }
                    }
                    
                    Text("\(className)")
                        .font(AppFont.smallReg)
                    
                    HStack{
                        Image(systemName: "phone.fill")
                            .font(.system(size: 17))
                        Text(String("\(phoneNumber)"))
                            .font(AppFont.smallReg)
                    }
                    .padding([.top, .bottom], 6)
                    .padding([.leading, .trailing], 12)
                    .background(Color.phoneAccent)
                    .foregroundStyle(Color.black)
                    .cornerRadius(50)
                    
                    //                    HStack {
                    //                            Button(action: {
                    //                                // Delete button action
                    //                                viewModel.deleteEnrolled(id: id)
                    //
                    //                            }) {
                    //                                Text("Delete")
                    //                                    .frame(minWidth: 90, minHeight: 30)
                    //                                    .background(Color.red)
                    //                                    .foregroundColor(.white)
                    //                                    .cornerRadius(8.0)
                    //                            }
                    //
                    //                    }
                    Spacer()
                }
                Spacer()
            }
            .frame(width: min(300,200), height: 100)
            .foregroundColor(.black)
            .fixedSize()
            .padding()
            .background(Color.accent)
            .cornerRadius(10)
        }
    }
}
    
#Preview {
    RequestSentCard(teacherName: "Teacher Name", phoneNumber: 1234567890 , id: "1", className: "Class Name")
}
