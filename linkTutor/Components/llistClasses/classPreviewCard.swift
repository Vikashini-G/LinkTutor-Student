import SwiftUI

struct classPreviewCard: View{
   
    var academy: String
    var className : String
    var phoneNumber : Int
    var price : Int
  
    var body: some View{
        VStack(alignment: .leading){
            HStack{
                //Image(systemName: "person.crop.square")
                
                
                    Image(systemName: "dummyProfilePic")
                        .resizable()
                        .clipped()
                        .frame(width: 85, height: 85)
                        .cornerRadius(50)
                        .padding(.trailing, 5)
                    VStack(alignment: .leading){
                        Text("\(academy)")
                            .font(AppFont.mediumSemiBold)
                        
                        Text("by \(className)")
                            .font(AppFont.smallReg)
                        
                        //4.5 stars and 40 reviews
                        HStack{
                            Text("4.0 ⭐️")
                                .font(AppFont.smallReg)
                                .padding([.top, .bottom], 4)
                                .padding([.leading, .trailing], 8)
                                .background(.white)
                                .cornerRadius(50)
                                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 12)
                            Text("40 reviews")
                                .font(AppFont.smallReg)
                                .padding(.leading, 5)
                                .foregroundColor(.gray)
                        }
                        //Spacer()
                        
                    }
                    Spacer()
                    
                }
                
                //tutor address
                HStack{
                    Image("location")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Chennai")
                }
            HStack{
                HStack{
                    Image(systemName: "phone.fill")
                        .font(.system(size: 20))
                    Text("\(phoneNumber)")
                        .font(AppFont.actionButton)
                   
                }
                .padding([.top, .bottom], 4)
                .padding([.leading, .trailing], 12)
                .background(Color.phoneAccent)
                .cornerRadius(50)
                
                Spacer()
                Text("\(price)")
            
            }
                
                //phone and message option
                //            HStack{
                //
                //                .background(Color.phoneAccent)
                //
                //
                //                HStack{
                //                    Image(systemName: "message.fill")
                //                        .font(.system(size: 17))
                //                    Text("iMessage")
                //                        .font(AppFont.actionButton)
                //                }
                //                .padding([.top, .bottom], 4)
                //                .padding([.leading, .trailing], 12)
                //                .overlay(
                //                    RoundedRectangle(cornerRadius: 20)
                //                        .stroke(Color.messageAccent, lineWidth: 2)
                //                )
                //                .cornerRadius(50)
                //                .background(Color.messageAccent)
                //            }
                
                
                
                //Spacer()
                
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: 170)
            .padding()
            .foregroundStyle(Color.black)
            .background(.accent)
            .cornerRadius(20)
        }
    
}

#Preview {
    classPreviewCard(academy: "unknown's Acadmey", className: "Unknown", phoneNumber: 123456789, price: 2000)
}
