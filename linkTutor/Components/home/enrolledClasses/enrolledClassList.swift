import SwiftUI

struct enrolledClassList: View {
    var classdata : enrolledClassDataM
  
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 10) {
                ForEach(enrolledClassMockData.classData){
                    classCard in enrolledClassCard(classCard: classCard)
                }
                
            }
        }
        .padding(.leading)
        //.shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 12)
    }
}

#Preview{
    enrolledClassList(classdata: enrolledClassMockData.sampleClassData)
}
