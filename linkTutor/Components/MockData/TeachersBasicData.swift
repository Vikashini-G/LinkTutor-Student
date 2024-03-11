//
//  TeachersData.swift
//  linkTutor
//
//  Created by Aditya Pandey on 08/03/24.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseDatabase

class TeachersBasicData : ObservableObject {
    
    func getData() {
        //Get a reference to the database
        let db = Firestore.firestore()
        
        //Read the document at a specified path
        db.collection("Teachers").getDocuments { snapshot , error in
            
            //Check the error
            if error == nil {
                
            }
        }
        
    }
}


struct TeacherBasicDataStore : Identifiable {
    var id : String
    var fullName : String
    var occupation : String
    var tutorPhone : String
    var address : String
    var location : NSTextLocation
}
