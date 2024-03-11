import SwiftUI

struct menuBar: View{
    var body: some View{
        HStack{
            Spacer()
            NavigationLink(destination: homeScreen()) {Image(systemName: "house")
                .foregroundColor(Color.black)
                .font(.system(size: 20))
                .navigationBarBackButtonHidden(true)}
            Spacer()
            NavigationLink(destination: homeScreen()) {Image(systemName: "house")
                .frame(width: 25, height: 25)
                .navigationBarBackButtonHidden(true)}
            Spacer()
            NavigationLink(destination: homeScreen()) {Image(systemName: "house")
                .frame(width: 25, height: 25)
                .navigationBarBackButtonHidden(true)}
            Spacer()
            
        }
        .padding()
        .background(Color.accent)
        .cornerRadius(40)
        .padding(.horizontal)
//        .edgesIgnoringSafeArea(.all)
        
    }
}

#Preview {
    menuBar()
}

