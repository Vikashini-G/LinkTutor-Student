//
//  MockData.swift
//  linkTutor
//
//  Created by user2 on 01/02/24.
//

import Foundation

struct classMockData: Identifiable, Equatable {
    
    let id = UUID()
    let skillType: String
    
    static func == (lhs: classMockData, rhs: classMockData) -> Bool {
        // Implement equality comparison based on your requirements
        return lhs.id == rhs.id && lhs.skillType == rhs.skillType
    }

   

    struct StudentData: Equatable {
        
        var className : String
        static func == (lhs: classMockData.StudentData, rhs: classMockData.StudentData) -> Bool {
            return lhs.className == rhs.className
        }
        
        struct classNameData {
            let tutorName: String
            let tutorImage: String
            let tutorRating: Double
            let reviewCount: Int
            let tutorAddress: String
            let tutorPhone: String
            let aboutParagraph : String
            let Days : String
        }
        let diffClassType : classNameData
    }
    let studentsData: StudentData
}

struct classesMockData {
   static let sampleClassData = classMockData(
        skillType: "Your Skill",
        studentsData: classMockData.StudentData(

            className: "Unknown's Classes",
            diffClassType :  classMockData.StudentData.classNameData(
            tutorName: "Unknown",
            tutorImage: "Sunflower",
            tutorRating: 4.0,
            reviewCount: 40,
            tutorAddress: "Chennai",
            tutorPhone: "123456789" ,
            aboutParagraph:  "I am a good Teacher" ,
            Days : "Monday"
     )))

    static let classdata = [ classMockData(
        skillType: "Dancing",
        studentsData: classMockData.StudentData(

            className: "Aditya's Classes",
            diffClassType :  classMockData.StudentData.classNameData(
            tutorName: "Aditya",
            tutorImage: "teacherStockImage",
            tutorRating: 4.0,
            reviewCount: 40,
            tutorAddress: "Chennai",
            tutorPhone: "123456789",
            aboutParagraph:  "I am a good Teacher" ,
            Days : "Monday"
     ))),
                             classMockData(
                                 skillType: "Dancing",
                                 studentsData: classMockData.StudentData(

                                     className: "Vikashini's Classes",
                                     diffClassType :  classMockData.StudentData.classNameData(
                                     tutorName: "Vikashini",
                                     tutorImage: "teacherStockImage",
                                     tutorRating: 4.0,
                                     reviewCount: 40,
                                     tutorAddress: "Chennai",
                                     tutorPhone: "123456789",
                                     aboutParagraph:  "I am a good Teacher" ,
                                     Days : "Monday"
                              ))),
                             
                             classMockData(
                                 skillType: "Singing",
                                 studentsData: classMockData.StudentData(

                                     className: "Srishti's Classes",
                                     diffClassType :  classMockData.StudentData.classNameData(
                                     tutorName: "Srishti",
                                     tutorImage: "teacherStockImage",
                                     tutorRating: 4.0,
                                     reviewCount: 40,
                                     tutorAddress: "Chennai",
                                     tutorPhone: "123456789",
                                     aboutParagraph:  "I am a good Teacher" ,
                                     Days : "Monday"
                              ))),
                             
                             classMockData(
                                 skillType: "Piano's",
                                 studentsData: classMockData.StudentData(

                                     className: "Ritwatz's Classes",
                                     diffClassType :  classMockData.StudentData.classNameData(
                                     tutorName: "Ritwatz",
                                     tutorImage: "teacherStockImage",
                                     tutorRating: 4.0,
                                     reviewCount: 40,
                                     tutorAddress: "Chennai",
                                     tutorPhone: "123456789",
                                     aboutParagraph:  "I am a good Teacher" ,
                                     Days : "Monday"
                              ))),
                             
                             classMockData(
                                 skillType: "Programming",
                                 studentsData: classMockData.StudentData(

                                     className: "Pardha's Classes",
                                     diffClassType :  classMockData.StudentData.classNameData(
                                     tutorName: "Aditya",
                                     tutorImage: "teacherStockImage",
                                     tutorRating: 4.0,
                                     reviewCount: 40,
                                     tutorAddress: "Chennai",
                                     tutorPhone: "123456789",
                                     aboutParagraph:  "I am a good Teacher" ,
                                     Days : "Monday"
                              ))),
                            
                             classMockData(
                                 skillType: "Programming",
                                 studentsData: classMockData.StudentData(

                                     className: "Aditya's Classes",
                                     diffClassType :  classMockData.StudentData.classNameData(
                                     tutorName: "Aditya",
                                     tutorImage: "teacherStockImage",
                                     tutorRating: 4.0,
                                     reviewCount: 40,
                                     tutorAddress: "Chennai",
                                     tutorPhone: "123456789",
                                     aboutParagraph:  "I am a good Teacher" ,
                                     Days : "Monday"
                              )))
    
    
    ]
        
}
