import SwiftUI

struct CustomTabView: View {
    var body: some View {
        TabView {
            Text(" ")
                .tabItem {
                    Label("홈", systemImage: "house")
                }
            Text(" ")
                .tabItem {
                    Label("동네생활", systemImage: "building.2")
                }
            Text(" ")
                .tabItem {
                    Label("내 근처", systemImage: "person.2")
                }
            Text(" ")
                .tabItem {
                    Label("채팅", systemImage: "message")
                }
            Text(" ")
                .tabItem {
                    Label("나의 당근", systemImage: "person")
                }
        }
        .edgesIgnoringSafeArea(.bottom)  // 하단 세이프 에리어까지 확장
        .background(Color.white)
    }
}
