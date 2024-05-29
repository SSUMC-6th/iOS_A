import SwiftUI

struct ParentView: View {
    @State private var cartItems = [FoodItem]()

    @State private var foodGroups: [FoodGroup] = [
        FoodGroup(name: "가격", items: [FoodItem(name: "M", price: 20000, isSelected: false), FoodItem(name: "L", price: 23000, isSelected: false)]),
        FoodGroup(name: "도우 변경", items: [FoodItem(name: "치즈 크러스트", price: 4000, isSelected: false), FoodItem(name: "고구마 크러스트", price: 3500, isSelected: false)])
    ]

    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(foodGroups.indices, id: \.self) { groupIndex in
                        let group = foodGroups[groupIndex]
                        Section(header: Text(group.name).font(.title2).bold()) {
                            ForEach(group.items.indices, id: \.self) { itemIndex in
                                let item = foodGroups[groupIndex].items[itemIndex]
                                HStack {
                                    Button(action: {
                                        foodGroups[groupIndex].items[itemIndex].isSelected.toggle()
                                    }) {
                                        Image(systemName: item.isSelected ? "checkmark.square.fill" : "square")
                                            .foregroundColor(.mint)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                    Text(item.name)
                                    Spacer()
                                    Text("\(item.price)")
                                }
                            }
                        }
                    }
                }
                .navigationTitle("음식 선택")

                Button("장바구니에 담기") {
                    addSelectedItemsToCart()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
            .toolbar {
                NavigationLink(destination: ChildView(cartItems: $cartItems)) {
                    Text("장바구니 보기")
                }
            }
        }
    }

    func addSelectedItemsToCart() {
        for group in foodGroups {
            for item in group.items where item.isSelected {
                if !cartItems.contains(where: { $0.id == item.id }) {
                    cartItems.append(item)
                }
            }
        }
    }

    func addToCart(item: FoodItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems[index].isSelected.toggle()
        } else {
            cartItems.append(item)
        }
    }
}
