//
//  Extension.swift
//  baki_week4
//
//  Created by 박희민 on 5/16/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
