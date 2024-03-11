import SwiftUI

struct GradientRectangle: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.blue, Color.clear]),
            startPoint: .top,
            endPoint: .bottom
        )
        .frame(width: 200, height: 300)
        .cornerRadius(10)
        .padding()
    }
}

struct GradientRectangle_Previews: PreviewProvider {
    static var previews: some View {
        GradientRectangle()
    }
}
