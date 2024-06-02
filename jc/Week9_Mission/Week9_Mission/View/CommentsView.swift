//
//  CommentsView.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import SwiftUI

struct CommentsView: View {
    @State private var items : [Comments] = []
    
    var body: some View {
        NavigationStack {
            List(items) { item in
                Text(item.content)
            }
            .onAppear(perform: {
                APIServer.shared.fetchCommentsData { items in
                    self.items = items
                }
            })
            .navigationTitle("Comments")
        }
    }
}

#Preview {
    CommentsView()
}
