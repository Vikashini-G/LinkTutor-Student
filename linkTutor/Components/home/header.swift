import SwiftUI

struct header: View{
    
    var yourName: String
    var body: some View{
        HStack{
            VStack(alignment: .leading){
                HStack{
                    Text("Hi")
                        .font(AppFont.largeBold)
                    Text(yourName)
                        .font(AppFont.largeBold)
                        .padding(.bottom, 1)
                    Spacer()
                    //myProfileView
                    NavigationLink(destination: myProfileView()){
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .clipped()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.gray)
                    }
                }
                Text("what are you looking for today?")
                    .font(AppFont.mediumReg)
            }
            Spacer()

            
        }
    }
}

#Preview {
        header(yourName: "Emma")
}
