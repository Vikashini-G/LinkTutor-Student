//import SwiftUI

//struct reviewCard: View{
//    var ratingstar : String = "⭐️"
//    var reviewRating: Int
//    var review: String
//    var time : String
//    var body: some View{
//        VStack{
//            HStack{
//                Text("\(ratingstar)")
//                Spacer()
//                Text("\(time)")
//                    .foregroundStyle(.gray)
//            }
//            HStack{
//                Text("\(review)")
//                Spacer()
//            }.padding([.top, .bottom], 5)
//            Divider()
//                .background(Color.black)
//        }
//    }
//    
//    
//    mutating func forEach(0...<reviewRating){
//        ratingstar += ratingstar + ""
//    }
//}
//
//#Preview {
//    reviewCard(reviewRating: 2 , review: "Loved taking their classes!! " , time : "20 March")
//}


import SwiftUI

struct reviewCard: View {
    var reviewRating: Int
    var review: String
    var time: String
    
    var body: some View {
        VStack {
            HStack {
                Text("\(String(repeating: "⭐️", count: reviewRating))")
                Spacer()
                Text("\(time)")
                    .foregroundStyle(.gray)
            }
            HStack {
                Text("\(review)")
                Spacer()
            }
            .padding([.top, .bottom], 5)
            Divider()
        }
    }
}

struct ReviewCard_Previews: PreviewProvider {
    static var previews: some View {
        reviewCard(reviewRating: 2, review: "Loved taking their classes!!", time: "20 March")
    }
}


