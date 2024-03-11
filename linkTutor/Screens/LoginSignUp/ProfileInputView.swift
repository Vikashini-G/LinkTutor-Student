import SwiftUI

struct ProfileInputView: View {
    @State private var image: Image?
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var phoneNumber: String = ""
    @State private var about: String = ""
    @State private var showImagePicker: Bool = false
    
    var body: some View {
        
                VStack {
                    VStack{
                        HStack{
                            Text("Edit Profile ")
                                .font(AppFont.largeBold)
                            Spacer()
                        }
                        // Profile Photo
//                            if let image = image {
//                                image
//                                    .resizable()
//                                    .scaledToFit()
//                                    .frame(width: 100, height: 100)
//                                    .cornerRadius(50.0)
//                            } else {
//                                Image(systemName: "person.circle.fill")
//                                    .resizable()
//                                    .foregroundColor(.gray)
//                                    .frame(width: 90, height: 90)
//                                    .cornerRadius(50.0)
//
//                            }
                            
                        Button(action: {
                                showImagePicker = true
                        }) {
                            if let image = image {
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(50.0)
                            } else {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .foregroundColor(.gray)
                                    .frame(width: 90, height: 90)
                                    .cornerRadius(50.0)
                            
                            }
                            //Text("Change profile photo").foregroundColor(.blue)
                        }
                        .sheet(isPresented: $showImagePicker) {
                            ImagePicker(image: $image)
                        }
                    }
                    .padding()
                    
                    List{
                        Section(header: Text("")){
                            // Name TextField
                            TextField("Name", text: $name)
                            .listRowBackground(Color.elavated)
                            
                            // About TextField
                            TextField("About", text: $about)
                            .listRowBackground(Color.elavated)
                        }
                        Section(header: Text("")){
                            // Email TextField
                            TextField("Email Address", text: $email)
                            .listRowBackground(Color.elavated)
                        
                            // Phone Number TextField
                            TextField("Phone Number", text: $phoneNumber)
                            .listRowBackground(Color.elavated)
                        }
                        Section(header: Text("")){
                            // Password SecureField
                            SecureField("Password", text: $password)
                            .listRowBackground(Color.elavated)
                        }
                    }
                    .listStyle(.plain)
                    .background(.clear)
                    
                    // Submit Button
                    Button(action: submitProfileData) {
                        Text("Submit")
                            .font(AppFont.mediumSemiBold)
                            .foregroundStyle(Color.black)
                            .frame(width: 200, height: 35)
                            .padding()
                            .background(Color.accent)
                            .cornerRadius(50)
                    }
                    
                } //v end
                .background(Color.background)
        
    }
        
        func submitProfileData() {
            // Handle submission logic here
            print("Name: \(name)")
            print("Email: \(email)")
            print("Password: \(password)")
            print("Phone Number: \(phoneNumber)")
            print("About: \(about)")
            // You can perform additional actions here, such as validation or sending data to a server.
        }
    }


#Preview {
    ProfileInputView()
    }
//struct ProfileInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfileInputView()
//    }
//}




struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: Image?
    @Environment(\.presentationMode) var presentationMode

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = Image(uiImage: uiImage)
            }

            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}
