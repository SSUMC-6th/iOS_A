//
//  ContentView.swift
//  iOS_study_week10
//
//  Created by 김의정 on 6/28/24.
//

import SwiftUI

struct ContentView: View {
    @State var id: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                Text("UMC - 6th iOS 로그인🌷")
                    .padding(.top, 136)
                
                HStack(alignment: .center, spacing: 0) {
                    TextField("아이디", text: $id)
                        .padding(.leading, 20)
                        .padding(.vertical, 16)
                        .frame(width: 335, alignment: .leading)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.gray)
                        )
                }
                .padding(.top, 68)
                .padding(.horizontal,20)
                
                HStack(alignment: .center, spacing: 0) {
                    TextField("비밀번호", text: $password)
                        .padding(.leading, 20)
                        .padding(.vertical, 16)
                        .frame(width: 335, alignment: .leading)
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.gray)
                        )
                }
                .padding(.top, 8)
                .padding(.horizontal,20)
                
                Button(action:  {
                    
                } , label: {
                    Text("로그인")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(.mint)
                        .cornerRadius(20)
                })
                .padding(.horizontal, 20)
                .padding(.top, 68)
                
                Button(action:  {
                    
                } , label: {
                    Text("회원가입")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(.mint)
                        .background(.white)
                        .cornerRadius(20)
                })
                .padding(.horizontal, 20)
                .padding(.top, 10)
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}
