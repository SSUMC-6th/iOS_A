import SwiftUI

struct FoodItem: Identifiable {
    var id = UUID()
    var name: String
    var price: Int
    var isSelected: Bool
}

struct FoodGroup {
    var name: String
    var items: [FoodItem]
}
