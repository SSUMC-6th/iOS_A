//
//  HomeView.swift
//  iOS_study_week10
//
//  Created by 김의정 on 6/30/24.
//

import SwiftUI

struct HomeView: View {
    @State var showAlert: Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        VStack() {
            Text("홈 뷰 진입!").font(.system(size: 20)).padding()
            Text("UMC 6기 스터디 수고했어!🍀\n데모데이 하면서 모르는것 생기면 언제든지 물어봐~!!")
                .multilineTextAlignment(.center)
            Button(action:  {
                showAlert = true
            } , label: {
                Text("로그아웃")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(.mint)
                    .background(.white)
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
