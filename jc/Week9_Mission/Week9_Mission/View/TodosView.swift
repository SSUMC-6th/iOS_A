//
//  TodosView.swift
//  Week9_Mission
//
//  Created by Jiwoong CHOI on 6/2/24.
//

import SwiftUI

struct TodosView: View {
  @StateObject var koreanData : KoreanData
  
    var body: some View {
        NavigationStack {
          List(koreanData.todosItem) { item in
                Text(item.title)
            }
            .onAppear(perform: {
                APIServer.shared.fetchTodosData { todosItem in
                  DispatchQueue.main.async {
                    self.koreanData.todosItem = todosItem
                  }
                }
            })
            .navigationTitle("Todos")
        }
    }
}
