//
//  StimeTableCardwiftUIView.swift
//  linkTutor
//
//  Created by user2 on 30/01/24.
//

//import SwiftUI
//
//struct TimeTableCardSwiftUIView2: View {
//    var className: String
//    var tutorName: String
//    var time: String
//    
//    var body: some View {
//        VStack(alignment: .leading) { // Align the content to the left
//            HStack {
//                // Class
//                Text("\(className)")
//                    .font(AppFont.mediumSemiBold)
//                
//                Spacer()
//                
//                Button(action: {
//                    // Add your button action here
//                    print("Button Tapped!")
//                }) {
//                    Text("Set Reminder")
//                        .foregroundColor(.blue)
//                        .cornerRadius(8)
//                }
//            }
//            
//            Text("by \(tutorName)")
//                .font(AppFont.smallReg)
//            
//            Spacer().frame(height: 10)
//            
//            Text("Timing")
//                .font(AppFont.smallReg)
//                .foregroundColor(.gray)
//            
//            Text("\(time)")
//                .font(AppFont.smallReg)
//        }
//        .padding([.horizontal, .vertical], 15)
//        .background(Color.white)
//        .cornerRadius(10)
//        
//    }
//}

//struct TimeTableCardSwiftUIView_Previews2: PreviewProvider {
//    static var previews: some View {
//        TimeTableCardSwiftUIView2(className: "Spoken English", tutorName: "John Doe", time: "8 To 10 am")
//    }
//}

import SwiftUI
import UserNotifications
import EventKit

struct TimeTableCardSwiftUIView: View {
    var className: String
    var tutorName: String
    var classStartTime: Date
    var classEndTime: Date

    @State private var isShowingReminderPopup = false
    @State private var reminderTime = Date()
    @State private var note: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(className)")
                    .font(AppFont.mediumSemiBold)

                Spacer()

                Button(action: {
                    isShowingReminderPopup.toggle()
                }) {
                    Text("Set Reminder")
                        .font(AppFont.actionButton)
                        .foregroundColor(.accent)
                        .cornerRadius(8)
                }
                .sheet(isPresented: $isShowingReminderPopup) {
                    ReminderPopupView(isShowingReminderPopup: $isShowingReminderPopup, reminderTime: $reminderTime, note: $note, className: className, tutorName: tutorName)
                }
            }

            Text("by \(tutorName)")
                .font(AppFont.smallReg)

            Spacer().frame(height: 10)

            Text("Timing")
                .font(AppFont.smallSemiBold)
                .foregroundColor(.gray)

            HStack {
                Text("\(formattedTiming(date: classStartTime)) - \(formattedTimingWithoutDay(date: classEndTime))")
                    .font(AppFont.smallReg)
            }
        }
        .padding([.horizontal, .vertical], 15)
        .background(Color.elavated)
        .cornerRadius(10)
    }

    private func formattedTiming(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, h:mm a"
        return formatter.string(from: date)
    }

    private func formattedTimingWithoutDay(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "h:mm a"
        return formatter.string(from: date)
    }
}

struct TimeTableCardSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        TimeTableCardSwiftUIView(
            className: "Math",
            tutorName: "John Doe",
            classStartTime: Date(),
            classEndTime: Date().addingTimeInterval(3600)
        )
    }
}

struct ReminderPopupView: View {
    @Binding var isShowingReminderPopup: Bool
    @Binding var reminderTime: Date
    @Binding var note: String
    var className: String
    var tutorName: String

    let notify = NotificationHandler()
    @State var selectedDate = Date()

    var body: some View {
        VStack {
            DatePicker("Select Reminder Time", selection: $reminderTime, in: Date()..., displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()

            TextField("Note", text: $note)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Set Reminder") {
                notify.sendNotification(
                    date: reminderTime,
                    type: "date",
                    title: "LinkTutor",
                    subtitle: "\(className) with \(tutorName)",
                    body: note
                )
                isShowingReminderPopup.toggle()
            }
            .padding()
            .foregroundColor(.accent)
            .cornerRadius(8)
        }
        .padding()
        .cornerRadius(20)

    }
}
