//
//  menuStruct.swift
//  baki_week7
//
//  Created by 박희민 on 5/27/24.
//

import SwiftUI

struct Post: Identifiable {
    var id = UUID()
    var title: String
    var locate: String
    var price: String
    var imageName: String
    var reservation: String
    var comments: Int
    var likes: Int
}

