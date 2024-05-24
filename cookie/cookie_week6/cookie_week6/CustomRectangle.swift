import SwiftUI

struct CustomRectangle: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(Color.mint)
                    .frame(width: geometry.size.width, height: 100)
                    .cornerRadius(10.0)
                
                VStack {
                    Spacer()
                    SearchBarView()
                        .padding(.horizontal, 20)
                        .frame(width: geometry.size.width, height: 50)
                    Spacer()
                }
                .frame(width: geometry.size.width, height: 100)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .offset(y: -20)
        .frame(height: 100)  // GeometryReader의 높이 지정
        .padding(.bottom, 10)
    }
}
