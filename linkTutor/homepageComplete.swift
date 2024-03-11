//
//  homepageComplete.swift
//  linkTutor
//
//  Created by user2 on 03/03/24.
//

import SwiftUI


struct homepageComplete: View {
    var body: some View {
        NavigationStack {
            TabView {
                homeScreen()
                    .tabItem {
                        Label("Home", systemImage: "house")
                            .padding(.top)
                    }
//                searchScreen()
//                    .tabItem {
//                        Label("Search", systemImage: "magnifyingglass")
//                    }
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
                    // Add more sample classes as needed
                ])
                    .tabItem {
                        Label("My Timetable", systemImage: "calendar")
                    }
            }
            .accentColor(Color.accent)
        }
        .tint(Color.accent)
        .accentColor(Color.accent)
        //.navigationBarHidden(false)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    homepageComplete()
}
