import SwiftUI

struct listClassesScreen: View{
  
  //  @State private var selectedSortOption: SortOption = .lowToHigh

   
    
    let skillType: SkillType
  //  var skillId : SkillType.ID
    @ObservedObject var viewModel = SkillViewModel()
    @State private var isAscendingOrder = true
    
  // @Binding var isShowingDetailView : Bool
    
//    enum SortOption: String, Identifiable {
//        case lowToHigh = "Low to High"
//        case highToLow = "High to Low"
//        var id: String { self.rawValue }
//    }
    
    var body: some View {
        NavigationStack {
            ZStack{
              
//                VStack(alignment: .leading){
//                    HStack{
//                        
//                        Button {
//                            isShowingDetailView = false
//                        } label : {
//                            Image(systemName: "arrow.backward")
//                                .foregroundColor(Color(.label))
//                                .imageScale(.large)
//                                .frame(width : 44 , height : 44) // we increase the touch target if user click on the side of x then also it will responds
//                        }
//                        
//                        
//                        Text("\(skillType.id)")
//                            .font(AppFont.largeBold)
//                        Spacer()
//                        Button(action: {
//                            showActionSheet.toggle()
//                        }){
//                            Image(systemName: "line.3.horizontal.decrease")
//                                .resizable()
//                                .clipped()
//                                .frame(width: 25, height: 15)
//                                .foregroundColor(.accent)
//                                .padding(.trailing)
//                        }
//                        .actionSheet(isPresented: $isAscendingOrder) {
//                            ActionSheet(
//                                title: Text("Filter Options"),
//                                buttons: [
//                                    .default(Text("Low to High Price")) {
//                                         isAscendingOrder = true
//                                    },
//                                    .default(Text("High to Low Price")) {
//                                        isAscendingOrder = false
//                                    },
//                                    .cancel(),
//                                ]
//                            )
//                        }
//                    }
//                    .padding(.bottom, 15)
                ScrollView {
                    VStack {
                        HStack {
                            Button(action: {
                                if isAscendingOrder {
                                    viewModel.sortDetailsAscending(for: skillType)
                                } else {
                                    viewModel.sortDetailsDescending(for: skillType)
                                }
                                isAscendingOrder.toggle()
                            }) {
                                Text("Sort by Price \(isAscendingOrder ? "Descending" : "Ascending")")
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(Color.blue)
                                    .cornerRadius(8)
                            }
                        }
                        .padding()
                    }
                    VStack(alignment: .leading) {
                        if let skillTypeIndex = viewModel.skillTypes.firstIndex(where: { $0.id == skillType.id }) {
                            let skillTypeDetails = viewModel.skillTypes[skillTypeIndex] 
                            
                            ForEach(skillTypeDetails.skillOwnerDetails) { detail in
                                VStack(alignment: .leading) {
                                    
                              
                                    
                                    NavigationLink(destination: classLandingPage(teacherUid: detail.teacherUid, academy: detail.academy , skillUid: detail.skillUid , skillOwnerUid: detail.id)) {
                                        
                                        classPreviewCard(academy: detail.academy, className: detail.className, phoneNumber: 1234567890, price: Int(detail.price))
                                        
                                    }
                                    .padding()
                               }
                            }
                        } else {
                            Text("Loading...")
                        }
                        
                        
                    }
                    .padding()
                }
                .navigationTitle("Details")
                .onAppear {
                    viewModel.fetchSkillOwnerDetails(for: skillType)
                }
                    
                
            }
            .background(Color.background)
          
            
        }
        
    }
    
}


#Preview {
    listClassesScreen(skillType: SkillType(id: "1"))
}




