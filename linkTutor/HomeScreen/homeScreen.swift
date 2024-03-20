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
//                VStack{
                    ScrollView(.vertical, showsIndicators: false){
                    VStack{
                        //Enrolled classes section
                        SectionHeader(sectionName: "Enrolled Classes", fileLocation: enrolledClassVList(classdata: enrolledClassMockData.sampleClassData))
                            .onTapGesture {
                                viewModel.enrolledClassFramework = enrolledClassVList(classdata: enrolledClassMockData.sampleClassData)
                            }
                            .padding(.horizontal)
                        
                        //enrolled classes cards
                        enrolledClassList(classdata: enrolledClassMockData.sampleClassData)
                        
                        
                        //Explore skills section
                        HStack {
                            Text("Explore Skills!")
                                .font(AppFont.mediumSemiBold)
                            Spacer()
                        }
                        .padding(.top, 30)
                        .padding(.bottom, 15)
                        .padding(.horizontal)
                        
                        
                        //explore classes cards
                        allPopularCard()
                        
                        //                    ScrollView(.vertical, showsIndicators: false){
                        //                        HStack(spacing: 10) {
                        //                            ForEach(1..<4) { index in
                        //                                popularClassCard(classData: classesMockData.classdata[index] , iconName: "book")
                        //                                    .onTapGesture {
                        //                                        viewModel.selectedFramework = classesMockData.classdata[index]
                        //                                    }
                        //
                        //                            }
                        //                        }
                        //                        Spacer()
                        //                    }
                        //                    .fullScreenCover(isPresented: $viewModel.isShowingDetailView) {
                        //                        listClassesScreen(classData : viewModel.selectedFramework ?? classesMockData.sampleClassData, isShowingDetailView: $viewModel.isShowingDetailView)
                        //                    }
                        
                        
                        Spacer().frame(height: 150)
                        
                        HStack{
                            Spacer()
                            Text("Here's to unlocking your full potential!")
                                .font(AppFont.actionButton)
                                .foregroundStyle(Color.gray)
                            Spacer()
                        }
                        
                        Spacer().frame(height: 30)
                    }
                }
                    .edgesIgnoringSafeArea(.bottom)
            }
            .background(Color.background)
            .environment(\.colorScheme, .dark)
        }
    }
        
}
    


#Preview {
    homeScreen()
}


