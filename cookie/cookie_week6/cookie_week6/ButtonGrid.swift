import SwiftUI

struct ButtonGrid: View {
    var body: some View {
        Group {
            VStack(spacing: 10) {
                Text("대용량특가")
                ForEach(0..<2) { row in
                    HStack(spacing: 10) {
                        ForEach(0..<5) { col in
                            GridButton(imageIndex: row*5 + col+1)
                        }
                    }
                }
            }
        }
        .padding(7)
        .background(RoundedRectangle(cornerRadius: 15.0).strokeBorder(Color.gray))
    }
}

struct GridButton: View {
    var imageIndex: Int
    
    var body: some View {
        Button(action: {}) {
            Image("img\(imageIndex)")
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipped()
                .background(RoundedRectangle(cornerRadius: 20.0))
                .contentShape(Rectangle())
        }
    }
}
