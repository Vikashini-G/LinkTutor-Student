import SwiftUI

struct quickInfoCard: View{
    var tutorAddress: String
    var tutionDays: String
    var tutionTiming: String
    var tutionFee: Int
    var body: some View{
        VStack{
            //address
            VStack(alignment: .leading){
                Text("Address")
                    .font(AppFont.smallSemiBold)
                HStack{
                    Image("locationLight")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.white)
                    Text("\(tutorAddress)")
                    Spacer()
                }
                .offset(y:-5)
            }
            .padding(.bottom, 5)
            
            //timing
            VStack(alignment: .leading){
                Text("Timing")
                    .font(AppFont.smallSemiBold)
//                    .foregroundColor(.gray)
                HStack{
                    Text("\(tutionDays)")
                        .padding(.trailing, 10)
                    Text("\(tutionTiming)")
                    Spacer()
                }
            }
            .padding(.bottom, 5)
            
            //Fee
            VStack(alignment: .leading){
                Text("Fee")
                    .font(AppFont.smallSemiBold)
//                    .foregroundColor(.gray)
                HStack{
                    Text("₹\(tutionFee) /month")
                    Spacer()
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 180 )
        .background(.elavated)
        .cornerRadius(10)
        //.shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 12)
    }
}

#Preview {
    quickInfoCard(tutorAddress: "Fake street name, New York", tutionDays: "Mon-Wed", tutionTiming: "4-5 pm", tutionFee: 2000)
}
