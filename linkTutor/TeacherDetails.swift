//
//  TeacherDetails.swift
//  linkTutor
//
//  Created by Aditya Pandey on 10/03/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

struct TeacherDetails: Identifiable, Codable , Equatable {
    var id: String
    var aboutParagraph: String
    var city: String
    var email: String
    var documentUid: String
    var fullName: String
    var location: GeoPoint // Assuming location is of type GeoPoint
    var occupation: String
    var phoneNumber: Int
}

class TeacherViewModel: ObservableObject {
    @Published var teacherDetails = [TeacherDetails]()
    private var db = Firestore.firestore()
    static let shared = TeacherViewModel()
    init() {
        TeacherViewModel()
    }

    func fetchTeacherDetails() {
        
        let db = Firestore.firestore()
        db.collection("Teachers").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        var details: [TeacherDetails] = []
                        for document in snapshot.documents {
                            let data = document.data()
                            let id = document.documentID
                            let aboutParagraph = data["aboutParagraph"] as? String ?? ""
                            let city = data["city"] as? String ?? ""
                            let email = data["email"] as? String ?? ""
                            let documentUid = data["documentUid"] as? String ?? ""
                            let fullName = data["fullName"] as? String ?? ""
                            // Assuming location is a GeoPoint
                            let location = data["location"] as? GeoPoint ?? GeoPoint(latitude: 0.0, longitude: 0.0)
                            let occupation = data["occupation"] as? String ?? ""
                            let phoneNumber = data["phoneNumber"] as? Int ?? 0
                            
                            let teacherDetail = TeacherDetails(id: id,
                                                               aboutParagraph: aboutParagraph,
                                                               city: city,
                                                               email: email,
                                                               documentUid: documentUid,
                                                               fullName: fullName,
                                                               location: location,
                                                               occupation: occupation,
                                                               phoneNumber: phoneNumber)
                            details.append(teacherDetail)
                        }
                        self.teacherDetails = details
                    }
                }
            } else {
                //Handle the error
                if let error = error {
                    print("Error fetching skill owner details: \(error.localizedDescription)")
                    return
                }
            }
            
           
            }
        }
    
    
    func fetchTeacherDetailsByID(teacherID: String) {
           db.collection("Teachers").document(teacherID).getDocument { document, error in
               if let error = error {
                   print("Error fetching teacher details: \(error.localizedDescription)")
                   return
               }
               guard let document = document, document.exists else {
                   print("Teacher document does not exist")
                   return
               }
               if let data = document.data() {
                   DispatchQueue.main.async {
                       let teacherDetail = TeacherDetails(
                           id: document.documentID,
                           aboutParagraph: data["aboutParagraph"] as? String ?? "",
                           city: data["city"] as? String ?? "",
                           email: data["email"] as? String ?? "",
                           documentUid: data["documentUid"] as? String ?? "",
                           fullName: data["fullName"] as? String ?? "",
                           location: data["location"] as? GeoPoint ?? GeoPoint(latitude: 0, longitude: 0),
                           occupation: data["occupation"] as? String ?? "",
                           phoneNumber: data["phoneNumber"] as? Int ?? 0
                       )
                       self.teacherDetails = [teacherDetail]
                   }
               }
           }
       }
   }

    


struct SkillDetailsView: View {
    @ObservedObject var teacherViewModel = TeacherViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(teacherViewModel.teacherDetails, id: \.id) { teacherDetail in
                    VStack(alignment: .leading) {
                        Text("ID: \(teacherDetail.id)")
                        Text("Full Name: \(teacherDetail.fullName)")
                        Text("Email: \(teacherDetail.email)")
                        Text("City: \(teacherDetail.city)")
                        Text("About: \(teacherDetail.aboutParagraph)")
                        Text("Occupation: \(teacherDetail.occupation)")
                        Text("Phone Number: \(teacherDetail.phoneNumber)")
                        Text("Location: Latitude: \(teacherDetail.location.latitude), Longitude: \(teacherDetail.location.longitude)")
                    }
                    .padding()
                }
            }
            .navigationBarTitle("Teacher Details")
            .onAppear {
                teacherViewModel.fetchTeacherDetails()
            }
        }
    }
}










#Preview {
    SkillDetailsView()
}
