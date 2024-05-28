import SwiftUI

struct VerticalScrollView: View {
    var row: Int  // 인덱스를 매개변수로 받음

    var body: some View {
        HStack {
            
            Image("img")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipped()
                .cornerRadius(10)
                .padding(.trailing, 10)
            VStack {
                Text("\(row)번째 아이템")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                Text("부가설명은 이렇게")
                    .font(.body)
                    .foregroundColor(.gray)
            }
        }
        .padding(.leading, 20)
    }
}
