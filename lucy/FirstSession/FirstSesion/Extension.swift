//
//  Extension.swift
//  FirstSesion
//
//  Created by 김수민 on 4/16/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
