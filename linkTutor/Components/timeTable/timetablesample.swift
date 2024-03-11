import SwiftUI

struct TimeTableCardSwiftUIView2: View {
    var className: String
    var tutorName: String
    var time: String

    var body: some View {
        VStack(alignment: .leading) { // Align the content to the left
            HStack {
                // Class
                Text("\(className)")
                    .font(AppFont.mediumSemiBold)

                Spacer()

                Button(action: {
                    // Add your button action here
                    print("Button Tapped!")
                }) {
                    Text("Set Reminder")
                        .foregroundColor(.blue)
                        .cornerRadius(8)
                }
            }

            Text("by \(tutorName)")
                .font(AppFont.smallReg)

            Spacer().frame(height: 10)

            Text("Timing")
                .font(AppFont.smallReg)
                .foregroundColor(.gray)

            Text("\(time)")
                .font(AppFont.smallReg)
        }
        .padding([.horizontal, .vertical], 15)
        .background(Color.white)
        .cornerRadius(10)

    }
}


#Preview{
    TimeTableCardSwiftUIView2(className: "Spoken English", tutorName: "John Doe", time: "8 To 10 am")
}
