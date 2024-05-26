import SwiftUI

struct ContentView: View {
    let randomInt = Int.random(in: 1..<21)  // 랜덤 인덱스 생성

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Header()
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(1..<21, id: \.self) { index in
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
                CustomTabView()
                    .frame(height: 50)
            }
            .navigationBarHidden(true)  // 내비게이션 바 숨기기
        }
    }
}
