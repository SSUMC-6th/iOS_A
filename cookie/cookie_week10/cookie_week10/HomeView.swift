import SwiftUI

struct HomeView : View {
    
    @State var showAlert: Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        Text("로그인 성공!")
    }
}

#Preview {
    HomeView()
}
