//
//  MenuTableViewCell.swift
//  week3
//
//  Created by 박희민 on 5/7/24.
//

import UIKit

class CartViewController: UIViewController {
    
    var quantity: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let howmanyLabel = UILabel(frame: CGRect(x: 50, y: 200, width: 200, height: 50))
        howmanyLabel.text = "수량: \(quantity)"
        view.addSubview(howmanyLabel)
    }
}
