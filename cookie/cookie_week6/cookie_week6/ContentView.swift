import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // 상단 Safe Area에 색상 적용
            Color.mint.edgesIgnoringSafeArea(.top)
                .frame(height: 0)
            
            CustomRectangle()
            
            CouponButton()
            
            ButtonGroup()
            
            ButtonGrid()
            
            CustomTabView()
        }
    }
}
