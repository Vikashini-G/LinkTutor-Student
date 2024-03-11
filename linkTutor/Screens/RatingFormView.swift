//
//  RatingFormView.swift
//  linkTutor
//
//  Created by user2 on 30/01/24.
//

import SwiftUI

struct RatingFormView: View {
    @State private var rating: Int = 0
    @State private var feedback: String = ""
    
    var body: some View {
        ZStack{
        
            Color(.background)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack(alignment: .center, spacing: 20) {
               
                Text("Rate Your Experience")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                
                // Star Rating
                HStack {
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: index <= self.rating ? "star.fill" : "star")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.yellow)
                            .onTapGesture {
                                self.rating = index
                            }
                    }
                }
                
                // Feedback TextField
                TextField("Enter your feedback", text: $feedback)
                    .padding()
                    .background(Color(UIColor.systemGray5))
                    .cornerRadius(8)
                    .padding(10)

                
                // Submit Button
                Button(action: {
                    self.submitRating()
                }) {
                    Text("Submit Rating")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 12)
                }
                
                Spacer()
            }
            .padding()
        }
    }
        
        func submitRating() {
            // Handle rating submission logic here
            print("Rating: \(rating)")
            print("Feedback: \(feedback)")
            // You can perform additional actions here, such as sending the data to a server.
        }
    }


struct RatingFormView_Previews: PreviewProvider {
    static var previews: some View {
        RatingFormView()
    }
}



#Preview {
    RatingFormView()
}
