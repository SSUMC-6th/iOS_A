//
//  TodosView.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import SwiftUI

struct TodosView: View {
    @State private var items: [Todos] = []

    var body: some View {
        NavigationStack {
            List(items) { item in
                Text(item.title)
            }
            .onAppear(perform: {
                APIServer.shared.fetchTodosData { items in
                    self.items = items
                }
            })
            .navigationTitle("Todos")
        }
    }
}

#Preview {
    TodosView()
}
