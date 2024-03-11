//
//  allPopularCard.swift
//  linkTutor
//
//  Created by user2 on 11/02/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine

struct allPopularCard: View {
    @ObservedObject var skillViewModel = SkillViewModel()
    @State private var selectedSkillType: SkillType?
    
    
    let columns : [GridItem] = [GridItem(.flexible()) ,GridItem(.flexible())]
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Text("Explore skills!")
                        .font(AppFont.largeBold)
                    Spacer()
                }
                ScrollView(){
                    LazyVGrid(columns: columns, spacing: 10){
                        ForEach(skillViewModel.skillTypes) { skillType in
                            let skillTypeName : String = skillType.id
                            NavigationLink(destination: listClassesScreen(skillType: skillType)){
                            popularClassCardV(skillId: skillTypeName.prefix(1).capitalized + skillTypeName.dropFirst(), iconName: "book")
                           
                                    
                            }
                        
                            
                        }
            
                        
                        
                        
                    }
                }
            }
            .padding()
            .edgesIgnoringSafeArea(.bottom)
            .background(Color.background)
            .environment(\.colorScheme, .dark)
     
                
            }
        }
}

#Preview {
    allPopularCard()
}

struct popularClassCardV: View{
    @ObservedObject var viewModel = SkillViewModel()
    @State private var selectedSkillType: SkillType?
    var skillId : String
    var iconName: String
    var body: some View{
        VStack{
            
            //class
            Text("\(skillId)")
                .font(AppFont.mediumSemiBold)
                .scaledToFit()
                //.minimumScaleFactor(0.6)
                    
//            //tutor
//            Text("by \(classData.studentsData.diffClassType.tutorName)")
//                .font(AppFont.smallReg)
//                .scaledToFit()
//                //.minimumScaleFactor(0.6)
                
            //icon
            Image("\(iconName)")
                .resizable()
                .frame(width: 80, height: 80)
            
        }
        .frame(width: 170, height: 140)
        .foregroundColor(.black)
        .background(Color.green)
        .cornerRadius(20)
    }
}



