import SwiftUI

struct enrolledClassDataM: Identifiable{
    var id = UUID()
    var className: String
    var tutorName: String
    var daysConducted: String
    var timing: String
}


struct enrolledClassMockData {
    static let sampleClassData = enrolledClassDataM(className: "sampleName",
                                                    tutorName: "sampleTutor",
                                                    daysConducted:  "anyDay",
                                                    timing: "4-5pm")
    
    static let classData = [
        enrolledClassDataM(className: "Aditya's Class",
                                                        tutorName: "Aditya Pandey",
                                                        daysConducted:  "Monday",
                                                        timing: "4-5pm"),
        enrolledClassDataM(className: "Pardha's Class",
                                                        tutorName: "Pardha",
                                                        daysConducted:  "Tuesday",
                                                        timing: "2-3pm"),
        enrolledClassDataM(className: "Vikashini's Class",
                                                        tutorName: "Vikashini",
                                                        daysConducted:  "Wednesday",
                                                        timing: "6-7pm"),
        enrolledClassDataM(className: "Ritwatz's Class",
                                                        tutorName: "Ritwatz",
                                                        daysConducted:  "Friday",
                                                        timing: "5-6pm")
        
    
    
    ]
}
