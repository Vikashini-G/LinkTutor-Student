import SwiftUI

struct TimetableClass: Identifiable, Hashable {
    let id: UUID
    var className: String
    var tutorName: String
    var classStartTime: Date
    var classEndTime: Date
}

struct MyTimetablePageSwiftUIView: View {
    var allClasses: [TimetableClass]
    @State private var selectedDate: Date = Date()
    @State private var isShowingFilterViewPopup = false
    
    var body: some View {
        ZStack {
            Color(.background)
                .edgesIgnoringSafeArea(.all)

            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("My Timetable")
                            .font(AppFont.largeBold)

                        Spacer()

                        Button(action: {
                            isShowingFilterViewPopup.toggle()
                        }) {
                            Image(systemName: "calendar")
                                .foregroundColor(.accent)
                                .font(.system(size: 30))
                                .clipped()
                        }
                    }
                    .padding(.bottom, 15)
                    .sheet(isPresented: $isShowingFilterViewPopup, content: {
                        VStack {
                            DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                                .datePickerStyle(GraphicalDatePickerStyle())
                                .padding()

                            HStack {
                                Button("Clear") {
                                    selectedDate = Date()
                                    isShowingFilterViewPopup.toggle()
                                }
                                .foregroundColor(.accent)

                                Spacer()

                                Button("Apply") {
                                    isShowingFilterViewPopup.toggle()
                                }
                                .foregroundColor(.accent)
                            }
                        }
                        .padding()
                    })
                    
                    // Filtered classes section
                    if formattedDate(date: selectedDate) != formattedDate(date: Date()) &&
                        formattedDate(date: selectedDate) != formattedDate(date: Date().addingTimeInterval(24 * 60 * 60)) {
                        HStack {
                            Text("\(formattedDate(date: selectedDate))")
                                .font(AppFont.mediumSemiBold)
                                .padding()
                            Spacer()
                            Button("Clear") {
                                selectedDate = Date()
                                isShowingFilterViewPopup = false
                            }
                        }
                        
                        if filteredClasses.isEmpty {
                            HStack{
                                Spacer()
                                Text("No classes")
                                    .font(AppFont.smallReg)
                                    .foregroundStyle(Color.gray)
                                Spacer()
                            }
                        } else {
                            ForEach(filteredClasses, id: \.self) { timetableClass in
                                TimeTableCardSwiftUIView(
                                    className: timetableClass.className,
                                    tutorName: timetableClass.tutorName,
                                    classStartTime: timetableClass.classStartTime,
                                    classEndTime: timetableClass.classEndTime
                                )
                            }
                        }
                    }


                    // Today's classes section
                    HStack{
                        Text("Today")
                            .font(AppFont.mediumSemiBold)
                            .padding()
                        Spacer()
                    }

                    VStack(spacing: 10){
                        ForEach(todayClasses, id: \.self) { timetableClass in
                            TimeTableCardSwiftUIView(
                                className: timetableClass.className,
                                tutorName: timetableClass.tutorName,
                                classStartTime: timetableClass.classStartTime,
                                classEndTime: timetableClass.classEndTime
                            )
                        }
                    }

                    // Tomorrow's classes section
                    HStack{
                        Text("Tomorrow")
                            .font(AppFont.mediumSemiBold)
                            .padding()
                        Spacer()
                    }

                    VStack(spacing: 10){
                        ForEach(tomorrowClasses, id: \.self) { timetableClass in
                            TimeTableCardSwiftUIView(
                                className: timetableClass.className,
                                tutorName: timetableClass.tutorName,
                                classStartTime: timetableClass.classStartTime,
                                classEndTime: timetableClass.classEndTime
                            )
                        }
                    }
                }
                .padding()
            }
            .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 12)
            .clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
            .navigationBarTitle("Timetable", displayMode: .inline)
        }
    }
    
    private func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: date)
    }
    
    // Filter classes for today
    private var todayClasses: [TimetableClass] {
        return filterClasses(for: Date())
    }

    // Filter classes for tomorrow
    private var tomorrowClasses: [TimetableClass] {
        return filterClasses(for: Date().addingTimeInterval(24 * 60 * 60)) // Adding one day (24 hours)
    }
    
    private var filteredClasses: [TimetableClass] {
        filterClasses(for: selectedDate)
    }
    
    // Helper function to filter classes based on a given date
    private func filterClasses(for date: Date) -> [TimetableClass] {
        return allClasses.filter { timetableClass in
            let calendar = Calendar.current
            return calendar.isDate(timetableClass.classStartTime, inSameDayAs: date)
        }
    }
}

struct MyTimetablePageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        MyTimetablePageSwiftUIView(allClasses: [
            TimetableClass(
                id: UUID(),
                className: "Math",
                tutorName: "John Doe",
                classStartTime: Date(),
                classEndTime: Date().addingTimeInterval(3600)
            ),
            TimetableClass(
                id: UUID(),
                className: "History",
                tutorName: "Jane Smith",
                classStartTime: Date().addingTimeInterval(86400),
                classEndTime: Date().addingTimeInterval(90000)
            ),
            TimetableClass(
                id: UUID(),
                className: "English",
                tutorName: "Carol",
                classStartTime: Date().addingTimeInterval(2 * 24 * 60 * 60),
                classEndTime: Date().addingTimeInterval(2 * 24 * 60 * 60 + 3600)
            ),
        ])
    }
}


////
////  MyTimetablePageSwiftUIView.swift
////  linkTutor
////
////  Created by user2 on 30/01/24.
////
//
//import SwiftUI
//
//struct TimetablePageSwiftUIView: View {
//    var body: some View {
//        //headerbox
//        ZStack{
//            VStack{
//                accentHeader()
//                Spacer()
//            }
//            .edgesIgnoringSafeArea(.top)
//
//            VStack(alignment: .leading) {
//
//                //header
//                HStack {
//                    Text("My Timetable")
//                        .font(AppFont.largeBold)
//
//                    Spacer()
//
//                    Button(action: {
//                        print("Calendar Tapped!")
//                    }) {
//                        Image(systemName: "calendar")
//                            .foregroundColor(.black)
//                            .font(.system(size: 30))
//                            .clipped()
//                    }
//                }
//                .padding(.bottom, 15)
//
//                //classes
//                ScrollView(.vertical, showsIndicators: false){
//                    HStack{
//                        Text("Today")
//                            .font(AppFont.mediumSemiBold)
//                            .padding()
//                        Spacer()
//                    }
//
//                    VStack(spacing: 10){
//                        TimeTableCardSwiftUIView(className: "Archery class", tutorName: "John Doe", time: "8 To 10 am")
//
//                        TimeTableCardSwiftUIView(className: "Archery class", tutorName: "John Doe", time: "8 To 10 am")
//                    }
//
//                    HStack{
//                        Text("Tomorrow")
//                            .font(AppFont.mediumSemiBold)
//                            .padding()
//                        Spacer()
//                    }
//
//                    VStack(spacing: 10){
//                        TimeTableCardSwiftUIView(className: "Archery class", tutorName: "John Doe", time: "8 To 10 am")
//
//                        TimeTableCardSwiftUIView(className: "Archery class", tutorName: "John Doe", time: "8 To 10 am")
//
//                        TimeTableCardSwiftUIView(className: "Archery class", tutorName: "John Doe", time: "8 To 10 am")
//
//                        TimeTableCardSwiftUIView(className: "Archery class", tutorName: "John Doe", time: "8 To 10 am")
//                    }
//                }
//                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 12)
//
//            }
//            .padding([.top, .trailing, .leading])
//
//
//
//            //.clipShape(RoundedRectangle(cornerRadius: 0, style: .continuous))
//            //.navigationBarTitle("Timetable", displayMode: .inline)
//        }
//        .background(Color.background)
//        }
//    }
//
//struct TimetablePageSwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimetablePageSwiftUIView()
//    }
//}
