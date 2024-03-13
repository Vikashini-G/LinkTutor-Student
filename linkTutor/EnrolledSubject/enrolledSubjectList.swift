//
//  enrolledSubjectList.swift
//  linkTutor
//
//  Created by Aditya Pandey on 13/03/24.
//

import SwiftUI
import Firebase

struct enrolledSubjectList: View {
    @StateObject var viewModel = RequestListViewModel()
    
    var body: some View {
        VStack {
            Text("Enrolled Students")
                .font(.title)
                .padding()
            
            VStack {
                ForEach(viewModel.enrolledStudents.filter { $0.requestAccepted == 0 }, id: \.id) { student in
                    enrolledSubjectCard(teacherName: student.teacherName, phoneNumber: student.teacherNumber, id: student.id , className: student.className)
                }
            }
            .onAppear {
                viewModel.fetchEnrolledStudents()
            }
        }
    }
}


struct EnrolledStudent: Identifiable {
    let id: String // Assuming this is the document ID in Firestore
    let teacherName: String
    let skillOwnerDetailsUid: String
    let studentName: String
    let studentUid: String
    let studentNumber: Int
    let requestAccepted: Int
    let requestDeleted : Int
    let className : String
    let teacherNumber : Int
}

class RequestListViewModel: ObservableObject {
    @Published var enrolledStudents: [EnrolledStudent] = []
    
    func fetchEnrolledStudents() {
        let db = Firestore.firestore()
        
        db.collection("enrolledStudent").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching documents: \(error)")
            } else {
                var enrolledStudentsData: [EnrolledStudent] = []
                for document in querySnapshot!.documents {
                    let studentData = document.data()
                    if let teacherName = studentData["teacherName"] as? String,
                       let id = studentData["id"] as? String,
                       let skillOwnerDetailsUid = studentData["skillOwnerDetailsUid"] as? String,
                       let studentName = studentData["studentName"] as? String,
                       let studentUid = studentData["studentUid"] as? String,
                       let studentNumber = studentData["studentNumber"] as? Int,
                       let requestAccepted = studentData["RequestAccepted"] as? Int ,
                       let requestDeleted = studentData["RequestDeleted"] as? Int ,
                        let className = studentData["className"] as? String ,
                    let teacherNumber = studentData["teacherNumber"] as? Int {
                        let enrolledStudent = EnrolledStudent(id: id, teacherName: teacherName,
                                                              skillOwnerDetailsUid: skillOwnerDetailsUid,
                                                              studentName: studentName,
                                                              studentUid: studentUid,
                                                              studentNumber: studentNumber,
                                                              requestAccepted: requestAccepted,
                                                              requestDeleted: requestDeleted ,
                                                                 className:  className ,
                                                                   teacherNumber: teacherNumber )
                        enrolledStudentsData.append(enrolledStudent)
                    }
                }
                self.enrolledStudents = enrolledStudentsData
            }
        }
    }
    
   
    
    
    
    func updateEnrolled(requestAccepted : Int , requestDeleted : Int , id : String) {
        let db = Firestore.firestore()
        
        let updatedData: [String: Any] = [
            "ReqestDeleted" : requestDeleted ,
            "RequestAccepted" : requestAccepted
        ]
        
        db.collection("enrolledStudent").document(id).setData(updatedData, merge: true) { error in
            if let error = error {
                print("Error updating document: \(error.localizedDescription)")
            } else {
                print("Document updated successfully")
            }
        }
    } //End of the function
    
    
    
    func deleteEnrolled(id: String) {
        let db = Firestore.firestore()
        
        let updatedData: [String: Any] = [
            "RequestDeleted": true, // or any appropriate value indicating deletion
            "RequestAccepted": "rejected" // or any appropriate value indicating rejection or deletion
        ]
        
        db.collection("enrolledStudent").document(id).setData(updatedData, merge: true) { error in
            if let error = error {
                print("Error updating document: \(error.localizedDescription)")
            } else {
                print("Document updated successfully for deletion")
            }
        }
    }


    
}

#Preview {
    enrolledSubjectList()
}
