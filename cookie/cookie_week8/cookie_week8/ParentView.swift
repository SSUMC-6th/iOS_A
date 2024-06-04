import SwiftUI

struct ParentView: View {
    @State private var cartSections = [CartSection]()
    
    @State private var foodGroups: [FoodGroup] = [
        FoodGroup(name: "가격", items: [FoodItem(name: "M", price: 20000, isSelected: false), FoodItem(name: "L", price: 23000, isSelected: false)]),
        FoodGroup(name: "도우 변경", items: [FoodItem(name: "치즈 크러스트", price: 4000, isSelected: false), FoodItem(name: "고구마 크러스트", price: 3500, isSelected: false)])
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section(header: Text("바싹 불고기 피자")) {
                        Text("피자입니다!!")
                    }
                    ForEach(foodGroups.indices, id: \.self) { groupIndex in
                        let group = foodGroups[groupIndex]  // 햔제 인덱스에 해당하는 FoodGroup 객체를 변수에 할당
                        // MARK: == Section
                        Section(header: Text(group.name).font(.title3)) {
                            ForEach(group.items.indices, id: \.self) { itemIndex in
                                let item = foodGroups[groupIndex].items[itemIndex]  // 현재 인덱스에 해당하는 FoodItem 객체를 변수에 할당
                                HStack {
                                    Button(action: {
                                        for i in foodGroups[groupIndex].items.indices {
                                            foodGroups[groupIndex].items[i].isSelected = false
                                        }
                                        foodGroups[groupIndex].items[itemIndex].isSelected.toggle()
                                    }) {
                                        // isSelected가 true/false일 때로 나누어 아이콘 설정
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

                HStack {
                    VStack {
                        Text("배달최소주문금액")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("17,000원")
                            .font(.footnote)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Button("장바구니에 담기") {
                        addSelectedItemsToCart()
                    }
                    .frame(width: 230)
                    .padding()
                    .background(.mint)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
                .padding(.horizontal, 20)
            }
            .toolbar {
                NavigationLink(destination: ChildView(cartSections: $cartSections)) {
                        Text("장바구니 보기")
                }
            }
        }
    }
    
    func addSelectedItemsToCart() {
        var newSectionItems: [FoodItem] = []
        for group in foodGroups {
            for item in group.items where item.isSelected {
                newSectionItems.append(item)
            }
        }
        if !newSectionItems.isEmpty {
            let newSection = CartSection(items: newSectionItems)
            cartSections.append(newSection)
        }
    }
}
