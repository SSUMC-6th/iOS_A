import SwiftUI

struct CustomTabView: View {
    var body: some View {
        TabView {
            Color.clear.tabItem {
                Label("검색", systemImage: "magnifyingglass")
            }
            Color.clear.tabItem {
                Label("찜", systemImage: "heart")
            }
            Color.clear.tabItem {
                Label(" ", systemImage: "b.circle")
            }
            Color.clear.tabItem {
                Label("주문 내역", systemImage: "menucard")
            }
            Color.clear.tabItem {
                Label("my 배민", systemImage: "person")
            }
        }
    }
}
