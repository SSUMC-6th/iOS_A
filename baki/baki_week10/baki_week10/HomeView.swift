//
//  HomeView.swift
//  baki_week10
//
//  Created by 박희민 on 6/30/24.
//

import SwiftUI

struct HomeView: View {
    @State var showAlert: Bool = false
    @EnvironmentObject var authViewModel: authViewModel
    
    var body: some View {
        VStack() {
            Text("로그인 성공")
                .multilineTextAlignment(.center)
            Button(action:  {
                showAlert = true
            } , label: {
                Text("로그아웃")
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .cornerRadius(20)
            })
            .padding(.horizontal, 20)
            .padding(.top, 10)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("로그아웃"),
                    message: Text("로그아웃 하시겠습니까?"),
                    primaryButton: .default(Text("취소").foregroundColor(.blue), action: {
                    }),
                    secondaryButton: .default(Text("확인").foregroundColor(.red), action: {
                        // 로그아웃 API 있을 경우 호출하기
                        authViewModel.logout()
                    })
                )
            }
        }
    }
}

#Preview {
    HomeView()
}
