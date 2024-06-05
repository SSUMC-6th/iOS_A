//
//  MenuTitle.swift
//  Week8_Mission
//
//  Created by Jiwoong CHOI on 6/6/24.
//

import SwiftUI

struct MenuTitle: View {
    @Binding var menuTitle : String
    @Binding var menuDetail : String
    
    var body: some View {
        VStack {
            Text(self.menuTitle)
            Text(self.menuDetail)
        }
    }
}
