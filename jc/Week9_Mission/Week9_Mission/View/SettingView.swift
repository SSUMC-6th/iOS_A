//
//  SettingView.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/3/24.
//

import SwiftUI

struct SettingView: View {
    @State private var settingItems: [SettingItems] = [
        SettingItems(title: "Login", iconString: "person.circle"),
        SettingItems(title: "Some Setting", iconString: "star"),
        SettingItems(title: "Another Setting", iconString: "heart"),
    ]

    // MARK: - Body Property

    var body: some View {
        NavigationStack {
            List(settingItems) { item in
                NavigationLink(value: item) {
                    HStack {
                        Image(systemName: item.iconString)
                        Text(item.titleString)
                    }
                }
            }
            .navigationTitle("Setting")
            .navigationDestination(for: SettingItems.self) { value in
                // 서로 다른 리스트로 어떻게 연결하는가?
                Text(value.titleString)
            }
        }
    }
}

#Preview {
    SettingView()
}
