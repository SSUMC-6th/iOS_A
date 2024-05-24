import SwiftUI

struct CouponButton: View {
    var body: some View {
        Button(action: {}) {
            Text("쿠폰 버튼")
                .frame(width: 320, height: 40)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10.0).strokeBorder())
                .frame(width: 200)
                .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
        .padding(.bottom, 10)
    }
}
