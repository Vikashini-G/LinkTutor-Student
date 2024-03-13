//
//  ReviewDetails.swift
//  linkTutor
//
//  Created by Aditya Pandey on 10/03/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

struct reviewData : Identifiable, Codable ,  Equatable {
    var id: String
    var comment : String
    var documentUid: String
    var ratingStar : Int
    var teacherUid: String
    var time: Date
    var skillUid: String
    var userUid : String
    var skillOwnerDetailsUid : String
}




class ReviewViewModel: ObservableObject {
    @Published var  reviewDetails = [reviewData]()
    private var db = Firestore.firestore()
    static let shared = ReviewViewModel()
    init() {
        fetchReviewDetails()
    }
    
    func fetchReviewDetails() {
        
        let db = Firestore.firestore()
        db.collection("review").getDocuments { snapshot, error in
            if error == nil {
                if let snapshot = snapshot {
                    DispatchQueue.main.async {
                        var details: [reviewData] = []
                        for document in snapshot.documents {
                            let data = document.data()
                            let id = document.documentID
                            let comment = data["comment"] as? String ?? ""
                            let documentUid = data["documentUid"] as? String ?? ""
                            let ratingStar = data["ratingStar"] as? Int ?? 0
                            let teacherUid = data["teacherUid"] as? String ?? ""
                            let time = data["time"] as? Date ?? Date()
                            
                            let skillUid = data["skillUid"] as? String ?? ""
                            let userUid = data["userUid"] as? String ?? ""
                            let skillOwnerDetailsUid = data["skillOwnerDetailsUid"] as? String ?? ""
                            
                            let reviewDetail = reviewData ( id: id,
                                                            comment: comment,
                                                            documentUid: documentUid,
                                                            ratingStar: ratingStar,
                                                            teacherUid: teacherUid,
                                                            time: time,
                                                            skillUid: skillUid ,
                                                            userUid: userUid,
                                                            skillOwnerDetailsUid: skillOwnerDetailsUid)
                            details.append(reviewDetail)
                        }
                        self.reviewDetails = details
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
    
    // if skillUid == skillUid and teacherUid == teacherUid then print data else dont print
    
//    func fetchReviewDetailsByID(teacherID: String , skillUid: String) {
//        db.collection("Teachers").document(teacherID).getDocument { document, error in
//            if let error = error {
//                print("Error fetching teacher details: \(error.localizedDescription)")
//                return
//            }
//            guard let document = document, document.exists else {
//                print("Teacher document does not exist")
//                return
//            }
//            if let data = document.data(),
//               let teacherUid = data["teacherUid"] as? String,
//               let documentSkillUid = data["skillUid"] as? String,
//               teacherUid == teacherID && documentSkillUid == skillUid {
//                DispatchQueue.main.async {
//                    let reviewDetail = reviewData(
//                        id: document.documentID,
//                        comment: data["comment"] as? String ?? "",
//                        documentUid: data["documentUid"] as? String ?? "",
//                        ratingStar: data["ratingStar"] as? Int ?? 0,
//                        teacherUid: teacherUid,
//                        time: (data["time"] as? Timestamp)?.dateValue() ?? Date(),
//                        skillUid: documentSkillUid,
//                        userUid: data["userUid"] as? String ?? ""
//                    )
//                    // Append to reviewDetails array
//                    self.reviewDetails.append(reviewDetail)
//                }
//            }
//            else {
//                print("loading")
//            }
//            
//        }
//    }

    
    
  
    
}





struct ReviewDetails: View {
    @ObservedObject var reviewViewModel = ReviewViewModel()

    var body: some View {
        NavigationView {
            ScrollView {

                
                
                ForEach(reviewViewModel.reviewDetails.filter { $0.teacherUid == "1" && $0.skillUid == "dance" &&  $0.skillOwnerDetailsUid == "1"    }) { teacherDetail in
                    if let formattedDate = formatDate(teacherDetail.time) {
                        reviewCard(reviewRating: teacherDetail.ratingStar, review: "\(teacherDetail.comment)", time : "\(formattedDate)")
                        
                    }
                }
                
                
               
            }
            .navigationBarTitle("Teacher Details")
            .onAppear {
              //  reviewViewModel.fetchReviewDetailsByID(teacherID: "1", skillUid: "dance")
              //  reviewViewModel.fetchReviewDetails()
            }
        }
    }
    
    func formatDate(_ date: Date) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY" // Date format: dayOfMonth month
        return dateFormatter.string(from: date)
    }
}


#Preview {
    ReviewDetails()
}



//ForEach(reviewViewModel.reviewDetails, id: \.id) { teacherDetail in
//                                    VStack(alignment: .leading) {
//                                        Text("ID: \(teacherDetail.id)")
//                                        Text("Comments: \(teacherDetail.comment)")
//                                        Text("Rating: \(teacherDetail.ratingStar)")
//                                        if let formattedDate = formatDate(teacherDetail.time) {
//                                            Text("Date: \(formattedDate)")
//                                        }
//                                        Text("Skill UID: \(teacherDetail.skillUid)")
//                                    }
//                                    .padding()
//                                }
