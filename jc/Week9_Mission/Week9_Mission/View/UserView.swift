//
//  UserView.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import SwiftUI

struct UserView: View {
  @StateObject var koreanData : KoreanData

    var body: some View {
        NavigationStack {
          List(koreanData.usersItem) { item in
                VStack {
                    Text(item.name)
                }
            }
            .onAppear(perform: {
                APIServer.shared.fetchUsersData { userItems in
                  DispatchQueue.main.async {
                    self.koreanData.usersItem = userItems
                  }
                }
            })
            .navigationTitle("Users")
        }
    }
}
