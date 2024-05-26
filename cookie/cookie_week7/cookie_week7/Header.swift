import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            Text("숭실대학교")  // 상단 바의 제목
                .font(.headline)
            Spacer()
            Button(action: {
                print("메뉴 버튼 클릭")
            }) {
                Image(systemName: "line.3.horizontal")
            }
            Button(action: {
                print("돋보기 버튼 클릭")
            }) {
                Image(systemName: "magnifyingglass")
            }
            Button(action: {
                print("알림 버튼 클릭")
            }) {
                Image(systemName: "bell")
            }
        }
        .padding()  // 수직 방향 패딩 증가
        .background(Color.white)  // 배경색 설정
        .frame(height: 50)  // HStack의 높이를 명시적으로 지정
    }
}
