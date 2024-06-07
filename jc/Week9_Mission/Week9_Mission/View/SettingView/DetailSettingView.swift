//
//  SettingDetailView.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/7/24.
//

import SwiftUI

struct DetailSettingView: View {
  let item: SettingItems

  var body: some View {
    switch item.detailType {
    case .Auth:
      AuthView()
    case .Type1:
      Type1View()
    case .Type2:
      Type2View()
    }
  }
}
