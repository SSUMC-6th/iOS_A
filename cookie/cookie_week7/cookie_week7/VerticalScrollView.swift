import SwiftUI

struct VerticalScrollView: View {
    var row: Int  // 인덱스를 매개변수로 받음

    var body: some View {
        Text("Row \(row)")
            .padding()
    }
}
