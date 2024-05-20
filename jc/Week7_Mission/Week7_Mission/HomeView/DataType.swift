//
//  ListData.swift
//  Week7_Mission
//
//  Created by Jiwoong CHOI on 5/20/24.
//

import Foundation
import SwiftUI

struct DataType: Identifiable {
  let id = UUID()
  let title: String
  let location: String
  let uploadDate: String
  let price: Int
  let image: Image
}
