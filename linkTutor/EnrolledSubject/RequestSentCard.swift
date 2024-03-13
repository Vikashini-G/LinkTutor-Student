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
                    Text("\(teacherName)")
                        .font(AppFont.mediumSemiBold)
                    
                    Text("\(className)")
                        .font(AppFont.smallSemiBold)
                    
                    Text("\(phoneNumber)")
                        .font(AppFont.smallReg)
                        .foregroundColor(.gray)
                        .padding(.top, 1)
                   
                    
                   
                    
                    HStack {
                        
                        
                      
                            Button(action: {
                                // Delete button action
                                viewModel.deleteEnrolled(id: id)
                                
                            }) {
                                Text("Delete")
                                    .frame(minWidth: 90, minHeight: 30)
                                    .background(Color.red)
                                    .foregroundColor(.white)
                                    .cornerRadius(8.0)
                            }
                        
                    }
                }
                Spacer()
            }
            .frame(width: min(300,200), height: 110)
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
