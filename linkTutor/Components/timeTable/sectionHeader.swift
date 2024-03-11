import SwiftUI

struct SectionHeader<Destination: View>: View {
    var sectionName: String
    var fileLocation: Destination
    
    var body: some View {
        HStack {
            Text("\(sectionName)")
                .font(AppFont.mediumSemiBold)
            Spacer()
            NavigationLink(destination: fileLocation) {
                Image(systemName:"arrow.right")
                    .font(.system(size: 20))
                    .foregroundColor(.accent)
            }
        }
        .padding(.top, 30)
        .padding(.bottom, 15)
    }
}


#Preview {
    SectionHeader(sectionName: "Sample section", fileLocation: allPopularCard())
}
