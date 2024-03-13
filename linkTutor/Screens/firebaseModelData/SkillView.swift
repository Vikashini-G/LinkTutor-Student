//
//  skillView.swift
//  linkTutor
//
//  Created by Aditya Pandey on 09/03/24.
//

import SwiftUI


//import SwiftUI
//
//struct SkillView: View {
//    @ObservedObject var viewModel = SkillViewModel()
//    @State private var selectedSkillType: SkillType?
//    
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                ForEach(viewModel.skillTypes) { skillType in
//                    let skillTypes = viewModel.skillTypes
//                    VStack(alignment: .leading) {
//                        NavigationLink(destination: SkillDetailsView(skillType: skillType)) {
//                            Text("Skill Type: \(skillType.id)")
//                                .font(.headline)
//                        }
//                        .padding()
//                    }
//                    .padding()
//                }
//            }
//            .navigationTitle("Skill Types")
//        }
//    }
//}
//
//struct SkillDetailsView: View {
//    let skillType: SkillType
//    
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading) {
//                
//                ForEach(skillType.skillOwnerDetails) { detail in
//                    VStack(alignment: .leading) {
//                        Text("Class Name: \(detail.className)")
//                            .padding()
//                        Text("Academy: \(detail.academy)")
//                            .padding()
//                        Text("Price: \(detail.price)")
//                            .padding()
//                        // Add other fields as needed
//                    }
//                }
//            }
//            .padding()
//        }
//        .navigationTitle("Details")
//    }
//}



//
//struct skilldetails : View {
//    @ObservedObject var viewModel = SkillViewModel()
//       @Binding var selectedSkillType: SkillType?
//
//       var body: some View {
//           VStack {
//               Text("hello")
//               if let skillType = selectedSkillType {
//                   viewModel.fetchSkillOwnerDetails(for: skillType)
//                   ForEach(skillType.skillOwnerDetails) { detail in
//                       VStack(alignment: .leading) {
//                           Text("Class Name: \(detail.className)")
//                               .padding()
//                           Text("Academy: \(detail.academy)")
//                               .padding()
//                           Text("Price: \(detail.price)")
//                               .padding()
//                           // Add other fields as needed
//                       }
//                   }
//               }
//           }
//       }
//}
//

