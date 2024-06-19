//
//  SuccessView.swift
//  baki_week9
//
//  Created by 박희민 on 6/19/24.
//

import SwiftUI

struct SuccessView: View {
    @Environment(\.presentationMode) var presentationMode
    var username: String

    var body: some View {
        VStack {
            Text("환영합니다, \(username)!")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("로그아웃")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
                    .padding()
            }
        }
        .navigationBarTitle("로그인 성공")
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView(username: "testUser")
    }
}
