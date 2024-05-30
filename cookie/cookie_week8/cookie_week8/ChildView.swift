import SwiftUI

struct ChildView: View {
    @Binding var cartSections: [CartSection]

    var body: some View {
        List {
            ForEach(cartSections, id: \.id) { section in
                Section {
                    ForEach(section.items, id: \.id) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("\(item.price)")
                        }
                    }
                }
            }
            .onDelete(perform: removeItems)
        }
        .navigationTitle("장바구니")
    }

    func removeItems(at offsets: IndexSet) {
        cartSections.remove(atOffsets: offsets)
    }
}
