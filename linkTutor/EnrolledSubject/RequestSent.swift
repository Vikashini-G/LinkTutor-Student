//
//  RequestSent.swift
//  linkTutor
//
//  Created by Aditya Pandey on 13/03/24.
//

//This code is working it is not showing anything because if the userId mathces then only it will show details as of now there is now details added in the database related to this id

import SwiftUI
import Firebase
import FirebaseAuth

struct RequestSent: View {
    @StateObject var viewModel = RequestListViewModel()
    
    var body: some View {
        VStack {
            Text("Enrolled Students")
                .font(.title)
                .padding()
            let userId = Auth.auth().currentUser?.uid
            VStack {
                ForEach(viewModel.enrolledStudents.filter { $0.requestSent == 1 && $0.id == userId }, id: \.id) { student in
                    RequestSentCard(teacherName: student.teacherName, phoneNumber: student.teacherNumber , id: student.id, className: student.className)
                }
            }
            .onAppear {
                viewModel.fetchEnrolledStudents()
            }
        }
    }
}

#Preview {
    RequestSent()
}
