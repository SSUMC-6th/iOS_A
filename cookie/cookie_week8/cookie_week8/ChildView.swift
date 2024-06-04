import SwiftUI

struct ChildView: View {
    @Binding var cartSections: [CartSection]

    var body: some View {
        VStack {
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
            
            // 총 금액을 표시하는 부분
            Text("총합 : \(totalPrice) 원")
                .font(.title)
                .padding()
        }
    }

    func removeItems(at offsets: IndexSet) {
        cartSections.remove(atOffsets: offsets)
    }
    
    // 총 금액을 계산하는 함수
    var totalPrice: Int {
        var total: Int = 0
        for section in cartSections {
            for item in section.items {
                total += item.price
            }
        }
        return total
    }
}
