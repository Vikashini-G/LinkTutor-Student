//
//  listClassesScreeenModel().swift
//  linkTutor
//
//  Created by user2 on 11/02/24.
//

import SwiftUI

final class listClassesScreenModel : ObservableObject {
    @Published var isShowingDetailView: Bool = false
    // this property needs to be published because we want our grid to be listening for when is showing View details view changes
    // when the isShowingViewDetail is changes to true then we are going to show the details
    
     var selectedFramework : classMockData?
    {
        didSet {
            isShowingDetailView = true
            //Any time the selected framework is changing we are going to make it true
            // When we tap on the grid this will change
        }
    }
    
    var popularClassFramework : allPopularCard?
    {
        didSet{
            isShowingDetailView = true
        }
    }
    
    var enrolledClassFramework : enrolledClassVList?
    {
        didSet{
            isShowingDetailView = true
        }
    }
    
//    var classLandingFramework : classLandingPage?
//    {
//        didSet{
//            isShowingDetailView = true
//        }
//    }
  
    init(isShowingDetailView: Bool = false) {
           self.isShowingDetailView = isShowingDetailView
       }
}
