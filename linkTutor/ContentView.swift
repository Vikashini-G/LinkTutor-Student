
import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    var body: some View {
     
        Group {
            if viewModel.userSession != nil {
                homepageComplete()
            } else {
                loginView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}


////
////  ContentView.swift
////  linkTutor
////
////  Created by user2 on 27/01/24.
////
//
//import SwiftUI
//
////extension UITabBarController {
////    open override func viewWillLayoutSubviews() {
////       super.viewWillLayoutSubviews()
////       self.tabBar.layer.masksToBounds = true
////       self.tabBar.layer.cornerRadius = 50 // whatever you want
////       self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner] // only the top right and left corners
////    }
////}
//
//struct ContentView: View {
////    init() {
////        UITabBar.appearance().backgroundColor = UIColor.accent
////        UITabBar.appearance().unselectedItemTintColor = UIColor
////    }
//    var body: some View {
//        VStack{
//            TabView {
//                homeScreen()
//                    .tabItem {
//                        Label("Home", systemImage: "house")
//                            .padding(.top)
//                    }
//                searchScreen()
//                    .tabItem {
//                        Label("Home", systemImage: "magnifyingglass")
//                    }
//                TimetablePageSwiftUIView()
//                    .tabItem {
//                        Label("My timetable", systemImage: "calendar")
//                    }
//            }
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}

//
//  ContentView.swift
//  linkTutor
//
//  Created by user2 on 27/01/24.
//
