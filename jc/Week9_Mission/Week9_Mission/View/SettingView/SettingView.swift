//
//  SettingView.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/3/24.
//

import SwiftUI

struct SettingView: View {
  @State private var settingItems: [SettingItems] = [
    SettingItems(titleString: "Authentication", iconString: "person", detailType: .Auth),
    SettingItems(titleString: "Some Setting", iconString: "star", detailType: .Type1),
    SettingItems(titleString: "Another Setting", iconString: "heart", detailType: .Type2)
  ]

  // MARK: - Body Property

  var body: some View {
    NavigationStack {
      List(settingItems) { item in
        NavigationLink {
          DetailSettingView(item: item)
        } label: {
          HStack {
            Image(systemName: item.iconString)
            Text(item.titleString)
          }
        }
      }
      .navigationTitle("Setting")
    }
  }
}

#Preview {
  SettingView()
}
