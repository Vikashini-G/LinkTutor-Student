import SwiftUI

struct onboardingPageSwiftUIView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                ZStack(alignment: .bottom) {
                    VStack {
                        Image("launchingScreen")
                            .resizable()
                            .clipped()
                            .ignoresSafeArea(.all)
                    }
                    HStack(alignment: .bottom) {
                        NavigationLink(destination: tabBarView()) {
                            Text("Get Started")
                                .frame(width: 250, height: 35)
                                .padding()
                                .background(.littleDarkAccent)
                                .foregroundColor(.black)
                                .cornerRadius(30)
                                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 12)
                        }
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// tabBarView
struct tabBarView: View {
    @State private var currentPage: Int = 0

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                TabView(selection: $currentPage) {
                    onboardingPage1SwiftUIView()
                        .tag(0)
                    onboardingPage2SwiftUIView()
                        .tag(1)
                    onboardingPage3SwiftUIView()
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))

                VStack {
                    Spacer()
                    if currentPage != 2 {
                        HStack(alignment: .bottom) {
                            Spacer()
                            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)) {
                                Text("Skip")
                                    .padding()
                                    .background(Color.littleDarkAccent)
                                    .foregroundColor(.black)
                                    .cornerRadius(30)
                            }
    
                        }
                        .padding()
                    } else {
                        HStack(alignment: .bottom) {
                            Spacer()
                            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true) ){
                                Text("Continue")
                                    .padding()
                                    .background(Color.littleDarkAccent)
                                    .foregroundColor(.black)
                                    .cornerRadius(30)
                            }
                        }.padding()
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }

}

// onboardingPage1SwiftUIView
struct onboardingPage1SwiftUIView: View {
    var body: some View {
        ZStack {
            VStack{
                HStack(){
                    FeatureRow(imageName: "exploreNewSkills", title: "Explore Your Skills", description: "Discover and enhance your abilities.")
                }
                HStack(alignment: .center) {
                    Image(systemName: "circle.fill")
                        
                    Image(systemName: "circle")
                        
                    Image(systemName: "circle")
                        
                }
                .padding()
            }
            .padding()
            .ignoresSafeArea(.all)
        }
    }
}

// onboardingPage2SwiftUIView
struct onboardingPage2SwiftUIView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    FeatureRow(imageName: "findATutor", title: "Find a Tutor", description: "Discover the perfect tutor for your needs.")
                }
                HStack {
                    Image(systemName: "circle")
                        
                    Image(systemName: "circle.fill")
                        
                    Image(systemName: "circle")
                        
                }
                .padding()
            }
            .padding()
            .ignoresSafeArea(.all)
        }
    }
}

// onboardingPage3SwiftUIView
struct onboardingPage3SwiftUIView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    FeatureRow(imageName: "manageYourTimetable", title: "Manage Your Timetable", description: "Access and organize your schedule with ease.")
                }
                HStack {
                    Image(systemName: "circle")
                        
                    Image(systemName: "circle")
                        
                    Image(systemName: "circle.fill")
                        
                }
                .padding()
            }
            .padding()
            .ignoresSafeArea(.all)
        }
    }
}

// FeatureRow
struct FeatureRow: View {
    var imageName: String
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .center){
            Image(imageName)
                .resizable()
                .clipped()
                .frame(width: 350, height: 350, alignment: .center)
                
            
                Text(title)
                    .font(.title)
                    
                Text(description)
                    .font(AppFont.mediumSemiBold)
                    .foregroundColor(.gray)
        }
        .padding(.top, 100)
    }
}


struct onboardingPageSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        onboardingPageSwiftUIView()
    }
}

struct onboardingPage1SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        onboardingPage1SwiftUIView()
    }
}

struct onboardingPage2SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        onboardingPage2SwiftUIView()
    }
}

struct onboardingPage3SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        onboardingPage3SwiftUIView()
    }
}

struct tabBarView_Preview: PreviewProvider {
    static var previews: some View {
        tabBarView()
    }
}

#Preview {
    onboardingPageSwiftUIView()
}
