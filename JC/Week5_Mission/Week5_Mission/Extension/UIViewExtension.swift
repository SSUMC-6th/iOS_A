//
//  UIViewExtension.swift
//  TableViewWithAPI
//
//  Created by Jiwoong CHOI on 4/24/24.
//

import Foundation
import UIKit

extension UIView {

  // 탐구해야 할 코드 문법
  func addSubviews(_ views: UIView...) {
    views.forEach {
      self.addSubview($0)
    }
  }
}
