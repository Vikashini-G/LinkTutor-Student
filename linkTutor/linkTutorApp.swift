//
//  linkTutorApp.swift
//  linkTutor
//
//  Created by user2 on 27/01/24.
//

import SwiftUI
import Firebase


@main
struct linkTutorApp: App {
    @StateObject var viewModel = AuthViewModel()
    
   @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    init(){ //to make tab bar have green accent on selected bar icon
       // FirebaseApp.configure()
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.selectionIndicatorTintColor = UIColor.green
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some Scene {
        WindowGroup {
       //     onboardingPageSwiftUIView()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
