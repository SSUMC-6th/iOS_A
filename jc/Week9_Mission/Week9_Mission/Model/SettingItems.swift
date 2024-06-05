//
//  SettingItems.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/3/24.
//

import Foundation
import SwiftUI

struct SettingItems: Identifiable, Hashable {
    let id = UUID()

    let titleString: String
    let iconString: String

    init(title: String, iconString: String) {
        titleString = title
        self.iconString = iconString
    }
}
