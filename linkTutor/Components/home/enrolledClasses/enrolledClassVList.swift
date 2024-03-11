//
//  enrolledClassVList.swift
//  linkTutor
//
//  Created by user2 on 12/02/24.
//

import SwiftUI

struct enrolledClassVList: View {
    var classdata : enrolledClassDataM
    var body: some View {
        VStack{
            HStack{
                Text("Enrolled Classes")
                    .font(AppFont.largeBold)
                    .foregroundStyle(Color.accent)
                Spacer()
            }
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 10) {
                    ForEach(enrolledClassMockData.classData){
                        classCard in enrolledClassCardV(classCard: classCard)
                    }
                }
            }
            Spacer()
        }
        .padding()
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.background)
        .environment(\.colorScheme, .dark)
    }
    
}

#Preview{
    enrolledClassVList(classdata: enrolledClassMockData.sampleClassData)
}

struct enrolledClassCardV: View{
    var classCard: enrolledClassDataM
    var body: some View{
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text(classCard.className)
                        .font(AppFont.mediumSemiBold)
                    Text(classCard.tutorName)
                        .font(AppFont.smallReg)
                    Text("Days")
                        .font(AppFont.smallSemiBold)
                        .foregroundColor(.gray)
                        .padding(.top, 1)
                    Text(classCard.daysConducted)
                        .font(AppFont.smallReg)
                    Text("Timing")
                        .font(AppFont.smallSemiBold)
                        .foregroundColor(.gray)
                        .padding(.top, 1)
                    Text(classCard.timing)
                        .font(AppFont.smallReg)
                }
                Spacer()
            }
            Spacer()
        }
        .frame(width: .infinity, height: 150)
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background(Color.elavated)
        .cornerRadius(10)
    }
}
