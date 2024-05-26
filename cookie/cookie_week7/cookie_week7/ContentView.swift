import SwiftUI

struct ContentView: View {
    let randomInt = Int.random(in: 0..<20)  // 랜덤 인덱스 생성

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(0..<20, id: \.self) { index in
                    if index == randomInt {
                        // 랜덤 인덱스에 대해 수평 스크롤 뷰 추가
                        HorizontalScrollView()
                    } else {
                        // 나머지는 일반 텍스트 뷰
                        VerticalScrollView(row: index)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}
