import SwiftUI

struct popularClassCard: View{
    var classData : classMockData
        var iconName: String
    var body: some View{
        VStack{
            //class
            Text("\(classData.skillType)")
                .foregroundStyle(Color.black)
                .font(AppFont.mediumSemiBold)
                .scaledToFit()
                //.minimumScaleFactor(0.6)
                    
            //tutor
            Text("by \(classData.studentsData.diffClassType.tutorName)")
                .foregroundStyle(Color.black)
                .font(AppFont.smallReg)
                .scaledToFit()
                //.minimumScaleFactor(0.6)
                
            //icon
            Image("\(iconName)")
                .resizable()
                .frame(width: 80, height: 80)
            
        }
        .frame(width: min(130, 160), height: 160)
        .background(Color.accent)
        .cornerRadius(20)
    }
}

#Preview {
    popularClassCard(classData: classesMockData.sampleClassData, iconName: "book")
}
