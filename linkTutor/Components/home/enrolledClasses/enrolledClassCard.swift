import SwiftUI

struct enrolledClassCard: View{
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
        .frame(width: min(150,180), height: 150)
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .background(Color.elavated)
        .cornerRadius(10)
        .environment(\.colorScheme, .dark) //DARK
    }
}

#Preview {
    enrolledClassCard(classCard: enrolledClassMockData.sampleClassData)
}
