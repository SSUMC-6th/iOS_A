//
//  PostsView.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import SwiftUI

struct PostsView: View {
    @State var items: [Posts] = []

    var body: some View {
        NavigationStack {
            List(items) { item in
                Text(item.content)
            }
            .onAppear(perform: {
                APIServer.shared.fetchPostsData { items in
                    self.items = items
                }
            })
            .navigationTitle("Posts")
        }
    }
}

#Preview {
    PostsView()
}
