import SwiftUI
import FirebaseAuth

struct homeScreen: View{
    @StateObject var viewModel = listClassesScreenModel()
    @EnvironmentObject var dataModel : AuthViewModel
   
    
    var body: some View{
       
        NavigationStack{
            VStack{
                VStack{
                    header(yourName: "Aditya")
                        .padding(.bottom)
                    NavigationLink(destination: searchScreen()){
                        HStack{
                            Image(systemName: "magnifyingglass")
                                .foregroundStyle(Color.myGray)
                            Text("Skills, tutors, centers...")
                            
                            Spacer()
                        }
                        .foregroundStyle(Color.myGray).opacity(0.6)
                        .padding(3)
                        .padding(.leading, 10)
                        .frame(width: 370, height: 35)
                        .background(.ultraThinMaterial)
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 15)
                
                VStack{
                    //Enrolled classes section
                    SectionHeader(sectionName: "Enrolled Classes", fileLocation: enrolledClassVList(classdata: enrolledClassMockData.sampleClassData))
                        .padding(.horizontal)
                        .onTapGesture {
                            viewModel.enrolledClassFramework = enrolledClassVList(classdata: enrolledClassMockData.sampleClassData)
                        }
                    
                    //enrolled classes cards
                    enrolledClassList(classdata: enrolledClassMockData.sampleClassData)
                    
                    
                    //Explore skills section
                    SectionHeader(sectionName: "Explore Skills!", fileLocation: allPopularCard())
                        .padding(.horizontal)
                        .onTapGesture {
                            viewModel.popularClassFramework = allPopularCard()
                        }
                       
                    
                    //explore classes cards
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 10) {
                            ForEach(1..<4) { index in
                                popularClassCard(classData: classesMockData.classdata[index] , iconName: "book")
                                    .onTapGesture {
                                        viewModel.selectedFramework = classesMockData.classdata[index]
                                    }
                                
                            }
                        }
                        
                        
                        Spacer()
                    }
                    //.shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 12)
                    .padding(.leading)
//                    .fullScreenCover(isPresented: $viewModel.isShowingDetailView) {
//                        listClassesScreen(classData : viewModel.selectedFramework ?? classesMockData.sampleClassData, isShowingDetailView: $viewModel.isShowingDetailView)
//                    }
                    
                    
                    Spacer()
                    
                    
                }
            }
            .background(Color.background)
            .environment(\.colorScheme, .dark)
        }
    }
        
}
    


#Preview {
    homeScreen()
}


