//
//  AuthViewModel.swift
//  linkTutor
//
//  Created by user2 on 03/03/24.
//


//It will be handling all the error associated with signIn
import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore
import FirebaseStorage


protocol AuthenticationFormProtocol {
    var FormIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    
    // This is firebaseAuth user
    @Published var userSession : FirebaseAuth.User?
    
    
    // This is our user
    @Published var currentUser: User?
    
    init() {
    self.userSession = Auth.auth().currentUser
        Task {
            await fetchUser()
        }
    }
    
    
    func signIn(withEmail email: String , password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email : String , password: String , fullName: String ) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid , fullName: fullName, email: email)
            // here user store data which you can't store directly on the firebase you have to store in form of json like raw data format with key value pair
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            
            //This is how we got information uploaded to firebase
            //first we go to firestore.firestore then collection there we got user then we create document using user id then set all the data of the user
            await fetchUser()
            //we need to fetch user because the above code will upload data into firebase and it will take some time to upload
            //and it won't go to next line until that process is complete that is why we use await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut() //signOUt user on backened
            self.userSession = nil   //wipes out user session and teakes us back to login screen
            self.currentUser = nil   // wipes out current user data model
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
            Auth.auth().currentUser?.delete()
            self.userSession = nil
            self.currentUser = nil

        let userId = Auth.auth().currentUser!.uid

                Firestore.firestore().collection("users").document(userId).delete() { err in
                    if let err = err {
                        print("error: \(err)")
                    } else {
                        print("Deleted user in db users")
                        Storage.storage().reference(forURL: "gs://myapp.appspot.com").child("users").child(userId).delete() { err in
                            if let err = err {
                                print("error: \(err)")
                            } else {
                                print("Deleted User image")
                                Auth.auth().currentUser!.delete { error in
                                   if let error = error {
                                       print("error deleting user - \(error)")
                                   } else {
                                        print("Account deleted")
                                   }
                                }
                            }
                        }
                    }
                }
    }
    func changePassword(password : String) {
        Task{
            
            await fetchUser()
        }
       Auth.auth().currentUser?.updatePassword(to: password) { err in
            if let err = err {
                print("error: \(err)")
            } else {
                print("Password has been updated")
                self.signOut()
            }
        }
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        //If there is data it will go and fetch data if there is not then it will return will wasting api calls
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        
       // print("DEBUG: Current user is \(String(describing: self.currentUser))")
    }
    
    
    //To add New Review
     func addReview(comment: String, documentUid : String , ratingStar : Int , skillOwnerDetailsUid : String , skillUid : String, teacherUid : String , time : String , className : String ) {
         
                 let db = Firestore.firestore()
         
                 Task {
                     await fetchUser()
                 }
                 let userId = Auth.auth().currentUser!.uid
         
                 // Create a dictionary representing the updated data
                 let data: [String: Any] = [
                     "academy": comment,
                     "id": documentUid,
                      "className" : className,
                     "ratingStar": ratingStar,
                     "skillOwnerDetailsUid": skillOwnerDetailsUid,
                     "skillUid": skillUid,
                     "teacherUid": teacherUid,
                     "time": time,
                     "userId": userId
                 ]
         
         // Add the document to review Collection
         db.collection("review").addDocument(data: data){ error in
             if let error = error {
                 print("Error adding document: \(error.localizedDescription)")
             } else {
                // TeacherHomePage()
                 print("Review added successfully to \(className) collection with ")
             }
         }
     }
     
     //To delete Review
     
     func deleteReview(userId: String, skillOwnerDetailsUid: String, teacherUid: String) {
         let db = Firestore.firestore()

         db.collection("review")
             .whereField("userId", isEqualTo: userId)
             .whereField("skillOwnerDetailsUid", isEqualTo: skillOwnerDetailsUid)
             .whereField("teacherUid", isEqualTo: teacherUid)
             .getDocuments { (querySnapshot, error) in
                 if let error = error {
                     print("Error fetching documents: \(error)")
                 } else {
                     for document in querySnapshot!.documents {
                         db.collection("review").document(document.documentID).delete { error in
                             if let error = error {
                                 print("Error deleting document: \(error.localizedDescription)")
                             } else {
                                 print("Review deleted successfully")
                             }
                         }
                     }
                 }
             }
     }

     
     
  //    To Update Review
     func updateReview(comment: String, documentUid : String , ratingStar : Int , skillOwnerDetailsUid : String , skillUid : String, teacherUid : String , time : String , className : String ) {

         let db = Firestore.firestore()
         
         Task {
             await fetchUser()
         }
         let userId = Auth.auth().currentUser!.uid
         
         // Create a dictionary representing the updated data
         let updatedData: [String: Any] = [
             "comment": comment,
             "id": documentUid,
             "ratingStar": ratingStar,
             "skillOwnerDetailsUid": skillOwnerDetailsUid,
             "skillUid": skillUid,
             "teacherUid": teacherUid,
             "time": time,
             "userId": userId
         ]
         
         // Update the document in the "skillOwnerDetails" collection with the provided documentId
         db.collection("review").document(documentUid).setData(updatedData, merge: true) { error in
             if let error = error {
                 print("Error updating document: \(error.localizedDescription)")
             } else {
                 print("Document updated successfully")
             }
         }
     }
    
    //When Enroll Now button will be clicked this function will be called
    
    func addEnrolledStudent(teacherName: String , skillOwnerDetailsUid: String, studentName: String, studentUid: String, studentNumber: Int, requestAccepted: Int, requestSent: Int, className: String, teacherNumber: Int) {
        let db = Firestore.firestore()
        
        let data: [String: Any] = [
            "teacherName": teacherName,
            "skillOwnerDetailsUid": skillOwnerDetailsUid,
            "studentName": studentName,
            "studentUid": studentUid,
            "studentNumber": studentNumber,
            "RequestAccepted": requestAccepted,
            "RequestSent": requestSent,
            "className": className,
            "teacherNumber": teacherNumber
        ]
        
        db.collection("enrolledStudent").addDocument(data: data){ error in
            if let error = error {
                print("Error adding document: \(error.localizedDescription)")
            } else {
                print("Document added successfully")
            }
        }
    }

    
}
