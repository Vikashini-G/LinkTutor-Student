//
//  RatingFormView.swift
//  linkTutor
//
//  Created by Aditya Pandey on 13/03/24.
//

import SwiftUI

struct RatingFormView: View {
    @State private var rating: Int = 0
    @State private var feedback: String = ""
    
    var body: some View {
            VStack(alignment: .center, spacing: 20) {
                Text("Rate Your Experience")
                    .font(AppFont.largeBold)
                    .padding(.bottom,40)
                // Star Rating
                HStack {
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: index <= self.rating ? "star.fill" : "star.fill")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .foregroundColor(.yellow)
                            .opacity(index <= self.rating ? 1.0 : 0.3)
                            .onTapGesture {
                                self.rating = index
                            }
                    }
                }
                
                // Feedback TextField
                TextField("Enter your feedback", text: $feedback, axis: .vertical)
                    .lineLimit(5...10)
                    .font(AppFont.smallReg)
                    .padding()
                    .background(Color.elavated)
                    .cornerRadius(8)
                    .padding(10)

                Spacer()
                
                // Submit Button
                Button(action: {
                    self.submitRating()
                }) {
                    Text("Submit Rating")
                        .font(AppFont.mediumSemiBold)
                        .background(Color.accent)
                        .foregroundColor(.black)
                }
                .frame(width:250,height:35)
                .padding()
                .background(Color.accent)
                .cornerRadius(50)
            }
            .padding()
            .background(Color.background)
    }
        
        func submitRating() {
            // Handle rating submission logic here
            print("Rating: \(rating)")
            print("Feedback: \(feedback)")
            // You can perform additional actions here, such as sending the data to a server.
        }
    }


#Preview {
    RatingFormView()
}
