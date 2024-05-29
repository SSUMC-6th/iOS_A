import SwiftUI

struct ChildView: View {
    @Binding var cartItems: [FoodItem]

    var body: some View {
        List {
            ForEach(cartItems, id: \.id) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text("\(item.price)")
                }
            }
            .onDelete(perform: removeItems)
        }
        .navigationTitle("장바구니")
    }

    func removeItems(at offsets: IndexSet) {
        cartItems.remove(atOffsets: offsets)
    }
}
