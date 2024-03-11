import SwiftUI

struct searchScreen: View{
    @State var searchText = ""
    @Environment(\.presentationMode) var presentationMode
//    Text("Hi Emma!").font(.system(size: 36).weight(.semibold)).fontDesign(.rounded).foregroundColor(.black).padding(.bottom, 1)
    init() {
            var titleFont = UIFont.preferredFont(forTextStyle: .largeTitle) /// the default large title font
            titleFont = UIFont(
                descriptor:
                    titleFont.fontDescriptor
                    .withDesign(.rounded)? /// make rounded
                    .withSymbolicTraits(.traitBold) /// make bold
                    ??
                    titleFont.fontDescriptor, /// return the normal title if customization failed
                size: 36
            )
            
            /// set the rounded font
            UINavigationBar.appearance().largeTitleTextAttributes = [.font: titleFont]
        }
    var body: some View{
        NavigationView {
            Text("Searching for \(searchText)")
                .navigationTitle("Search skills")
                .foregroundColor(.gray)
            
        }
        .searchable(text: $searchText)
        
    }
//    func goBack() {
//            presentationMode.wrappedValue.dismiss()
//    }
}


#Preview {
    searchScreen()
}


