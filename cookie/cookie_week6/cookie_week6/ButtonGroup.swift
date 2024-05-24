import SwiftUI

struct ButtonGroup: View {
    var body: some View {
        HStack(spacing: 10) {
            ForEach(1...3, id: \.self) { i in
                ImageButton(imageName: "btn\(i)")
            }
        }
        .padding(.bottom, 10)
    }
}

struct ImageButton: View {
    var imageName: String
    
    var body: some View {
        Button(action: {}) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .aspectRatio(contentMode: .fit)
                .frame(width: 110, height: 110)
                .background(RoundedRectangle(cornerRadius: 10.0))
                .clipped()
        }
        .buttonStyle(PlainButtonStyle())
    }
}
