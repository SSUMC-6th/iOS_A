import SwiftUI
import Moya

struct LogInView: View {
    
    @State var id: String = ""
    @State var pw: String = ""
    
    @State var showAlert: Bool = false
    @State var alertMessage: String = ""
    
    var body: some View {
        VStack (spacing: 0) {
            Text("로그인")
                .padding(.top, 230)
                .padding(.bottom, 20)
            
            TextField("ID", text: $id)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal, 20)
                .padding(.bottom, 20)

            
            SecureField("PW", text: $pw)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal,20)
                .padding(.bottom, 20)
            
            Button (action: {
                
            }, label: {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.mint)
                    .cornerRadius(20)
            })
            .padding(.horizontal, 20)
            .padding(.top, 10)

            
            Button (action: {

            }, label: {
                Text("Log In")
                    .foregroundColor(.white)
                    .frame(height: 50)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.mint)
                    .cornerRadius(20)
            })
            .padding(.horizontal, 20)
            .padding(.top, 10)

        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    LogInView()
}
