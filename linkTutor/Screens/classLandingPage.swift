
import SwiftUI



struct classLandingPage: View {
    var teacherUid: String
    var academy: String
    var skillUid : String
   var skillOwnerUid : String
    
   
    @ObservedObject var teacherViewModel = TeacherViewModel.shared
    @ObservedObject var reviewViewModel = ReviewViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                //Header
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(academy)")
                            .font(AppFont.largeBold)
                        
                        if let teacherDetails = teacherViewModel.teacherDetails.first {
                            Text("by \(teacherDetails.fullName)")
                                .font(AppFont.mediumReg)
                        } else {
                            Text("Loading...")
                                .font(AppFont.mediumReg)
                        }
                    }
                    Spacer()
                }
                
                ScrollView(.vertical) {
                    if !teacherViewModel.teacherDetails.isEmpty {
                        // View content using teacherViewModel.teacherDetails
                        if let teacherDetails = teacherViewModel.teacherDetails.first {
                            //Rating and Review
                            HStack{
                                Text("4.0 ⭐️")
                                    .font(AppFont.smallReg)
                                    .padding([.top, .bottom], 4)
                                    .padding([.leading, .trailing], 8)
                                    .foregroundStyle(Color.black)
                                    .background(.white)
                                    .cornerRadius(50)
                                    .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 12)
                                Text("40 reviews")
                                    .font(AppFont.smallReg)
                                    .padding(.leading)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            
                            
                            //Enroll button
                            HStack{
                                Button(action: {
                                    print("Enrollment action")
                                }) {
                                    Text("Enroll now")
                                        .font(AppFont.mediumReg)
                                        .foregroundColor(.black)
                                        .padding(10)
                                        .padding([.leading, .trailing], 20)
                                }
                                .background(Color.green)
                                .cornerRadius(20)
                                .padding([.top,.bottom], 10)
                                
                                Spacer()
                            }
                            
                            //quickInfoBox

                            quickInfoCard(tutorAddress: "\(teacherDetails.city)" , tutionDays: "\(30)", tutionTiming: "4-5 pm", tutionFee: 2000)
                                .padding([.top,.bottom], 10)
                 
                            HStack{
                                HStack{
                                    Image(systemName: "phone.fill")
                                        .font(.system(size: 17))
                                    
                            
                                    Text("\(teacherDetails.phoneNumber)")
                                        .font(AppFont.actionButton)
                                 
                                    
                                }
                                .padding([.top, .bottom], 6)
                                .padding([.leading, .trailing], 12)
                                .background(Color.phoneAccent)
                                .foregroundStyle(Color.black)
                                .cornerRadius(50)
                                
                                HStack{
                                    Image(systemName: "message.fill")
                                        .font(.system(size: 17))
                                    Text("iMessage")
                                        .font(AppFont.actionButton)
                                }
                                .padding([.top, .bottom], 4)
                                .padding([.leading, .trailing], 12)
                                .background(Color.messageAccent)
                                .foregroundStyle(Color.black)
                                .cornerRadius(50)
                                Spacer()
                            }
                            .padding([.top,.bottom], 10)
                            
                            
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Mode")
                                        .font(AppFont.smallSemiBold)
                                        .padding(.bottom, 5)
                                    VStack{
                                        HStack{
                                            Image(systemName: "checkmark")
                                                .font(.system(size: 20))
                                            Text("Online")
                                                .font(AppFont.smallReg)
                                                .foregroundColor(.gray)
                                            Spacer()
                                        }.padding(5)
                                        HStack{
                                            Image(systemName: "checkmark")
                                                .font(.system(size: 20))
                                            Text("Offline")
                                                .font(AppFont.smallReg)
                                                .foregroundColor(.gray)
                                            Spacer()
                                        }.padding(5)
                                    }
                                }
                                Spacer()
                            }
                            
                            
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Reviews")
                                        .font(AppFont.smallSemiBold)
                                        .padding(.bottom, 5)
                                  
                                    ForEach(reviewViewModel.reviewDetails.filter { $0.teacherUid == "\(teacherUid)" && $0.skillUid == "\(skillUid)"  &&  $0.skillOwnerDetailsUid == "\(skillOwnerUid)"}) { teacherDetail in
                                        if let formattedDate = formatDate(teacherDetail.time) {
                                            reviewCard(reviewRating: teacherDetail.ratingStar , review: "\(teacherDetail.comment)", time : "\(formattedDate)")
                                
                                        }
                                       
                                       
                                    }
//                                    reviewCard(reviewRating: "⭐️⭐️⭐️⭐️⭐️", review: "Loved taking their classes!! ", time:  "20 march")
//                                    reviewCard(reviewRating: "⭐️⭐️⭐️⭐️⭐️", review: "Loved taking their classes!! ", time:  "20 march")
//                                    reviewCard(reviewRating: "⭐️⭐️⭐️⭐️⭐️", review: "Loved taking their classes!! ", time:  "20 march")
                                    
                                    
                                    
                                    
                                }
                                .padding([.top,.bottom], 10)
                                Spacer()
                            }
                            
                            Spacer()
                        
                        } else {
                                                    Text("Loading...")
                                                        .font(AppFont.mediumReg)
                                                }
                        
                    } else {
                        Text("Loading...")
                            .padding()
                    }
                }
                .padding()
                
             
                
            }
            .background(Color.background)
            .onAppear {
              
//                reviewViewModel.fetchReviewDetailsByID(teacherID: teacherUid, skillUid: skillUid)
                teacherViewModel.fetchTeacherDetailsByID(teacherID: teacherUid)
                
              
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
    classLandingPage(teacherUid: "1", academy: "Unknown", skillUid: "dance", skillOwnerUid: "1")
}


//HStack{
//    VStack(alignment: .leading){
//        Text("Mode")
//            .font(AppFont.smallSemiBold)
//            .padding(.bottom, 5)
//        VStack{
//            HStack{
//                Image(systemName: "checkmark")
//                    .font(.system(size: 20))
//                Text("Classical Piano")
//                    .font(AppFont.smallReg)
//                    .foregroundColor(.gray)
//                Spacer()
//            }
//            .padding(5)
//            HStack{
//                Image(systemName: "checkmark")
//                    .font(.system(size: 20))
//                Text("Hindustani")
//                    .font(AppFont.smallReg)
//                    .foregroundColor(.gray)
//                Spacer()
//            }.padding(5)
//            HStack{
//                Image(systemName: "checkmark")
//                    .font(.system(size: 20))
//                Text("Carnatic")
//                    .font(AppFont.smallReg)
//                    .foregroundColor(.gray)
//                Spacer()
//            }.padding(5)
//        }
//    }
//    Spacer()
//}
//.padding([.top,.bottom], 10)

















//
//struct classLandingPage: View{
//
//  //  @StateObject var viewModel = listClassesScreenModel()
//    var teacherUid : String
//    var academy : String
//    let teacherViewModel = TeacherViewModel.shared
//
//
//
//
//    var body: some View{
//        if let teacherDetails = teacherViewModel.selectedTeacherDetails {
//
//        ZStack{
//
//            VStack{
//                //Header
//
//                HStack{
//                    VStack(alignment: .leading){
//                        Text("\(academy)")
//                            .font(AppFont.largeBold)
//                        Text("by \(teacherDetails.fullName)")
//                            .font(AppFont.mediumReg)
//                    }
//                    Spacer()
//                }
//
//
//                ScrollView(.vertical){
//
//                    //rating & review count
//                    HStack{
//                        Text("4.0 ⭐️")
//                            .font(AppFont.smallReg)
//                            .padding([.top, .bottom], 4)
//                            .padding([.leading, .trailing], 8)
//                            .foregroundStyle(Color.black)
//                            .background(.white)
//                            .cornerRadius(50)
//                            .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 12)
//                        Text("40 reviews")
//                            .font(AppFont.smallReg)
//                            .padding(.leading)
//                            .foregroundColor(.gray)
//                        Spacer()
//                    }
//
//                    //enroll button
//                    HStack{
//                        Button(action: {
//                            print("Enrollment action")
//                        }) {
//                            Text("Enroll now")
//                                .font(AppFont.mediumReg)
//                                .foregroundColor(.black)
//                                .padding(10)
//                                .padding([.leading, .trailing], 20)
//                        }
//                        .background(Color.accent)
//                        .cornerRadius(20)
//                        .padding([.top,.bottom], 10)
//
//                        Spacer()
//                    }
//
//                    //quickInfoBox
//                    quickInfoCard(tutorAddress: "\(teacherDetails.city)" , tutionDays: "\(30)", tutionTiming: "4-5 pm", tutionFee: 2000)
//                        .padding([.top,.bottom], 10)
//
//
//                    //phone and iMessage option
//                    HStack{
//                        HStack{
//                            Image(systemName: "phone.fill")
//                                .font(.system(size: 17))
//                            Text("\(teacherDetails.tutorPhone)")
//                                .font(AppFont.actionButton)
//                        }
//                        .padding([.top, .bottom], 6)
//                        .padding([.leading, .trailing], 12)
//                        .background(Color.phoneAccent)
//                        .foregroundStyle(Color.black)
//                        .cornerRadius(50)
//
//                        HStack{
//                            Image(systemName: "message.fill")
//                                .font(.system(size: 17))
//                            Text("iMessage")
//                                .font(AppFont.actionButton)
//                        }
//                        .padding([.top, .bottom], 4)
//                        .padding([.leading, .trailing], 12)
//                        .background(Color.messageAccent)
//                        .foregroundStyle(Color.black)
//                        .cornerRadius(50)
//                        Spacer()
//                    }
//                    .padding([.top,.bottom], 10)
//
//                    //about section
//                    HStack{
//                        VStack(alignment: .leading){
//                            Text("About")
//                                .font(AppFont.smallSemiBold)
//                                .padding(.bottom, 5)
//                            Text("\(teacherDetails.aboutParagraph)")
//                                .font(AppFont.smallReg)
//                                .foregroundColor(.gray)
//                        }
//                        .padding([.top,.bottom], 10)
//                        Spacer()
//                    }
//
//                    //Mode
//                    HStack{
//                        VStack(alignment: .leading){
//                            Text("Mode")
//                                .font(AppFont.smallSemiBold)
//                                .padding(.bottom, 5)
//                            VStack{
//                                HStack{
//                                    Image(systemName: "checkmark")
//                                        .font(.system(size: 20))
//                                    Text("Online")
//                                        .font(AppFont.smallReg)
//                                        .foregroundColor(.gray)
//                                    Spacer()
//                                }.padding(5)
//                                HStack{
//                                    Image(systemName: "checkmark")
//                                        .font(.system(size: 20))
//                                    Text("Offline")
//                                        .font(AppFont.smallReg)
//                                        .foregroundColor(.gray)
//                                    Spacer()
//                                }.padding(5)
//                            }
//                        }
//                        Spacer()
//                    } .onAppear {
//                        teacherViewModel.fetchTeacherDetailsByID(teacherID: teacherUid)
//                    }
//                }
//                    .padding([.top,.bottom], 10)
//
//                    //Offering Classes
//
//
//                    //Reviews
//                    HStack{
//                        VStack(alignment: .leading){
//                            Text("Reviews")
//                                .font(AppFont.smallSemiBold)
//                                .padding(.bottom, 5)
//                            reviewCard(reviewRating: "⭐️⭐️⭐️⭐️⭐️", review: "Loved taking their classes!! ")
//                            reviewCard(reviewRating: "⭐️⭐️⭐️⭐️⭐️", review: "Loved taking their classes!! ")
//                            reviewCard(reviewRating: "⭐️⭐️⭐️⭐️⭐️", review: "Loved taking their classes!! ")
//                        }
//                        .padding([.top,.bottom], 10)
//                        Spacer()
//                    }
//
//                    Spacer()
//                }
//            }
//
//            .padding([.top, .leading, .trailing])
//
//            .background(Color.background)
//
//
//        }
//    }
//}
