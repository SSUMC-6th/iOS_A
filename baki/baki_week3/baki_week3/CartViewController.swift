//
//  CartViewController.swift
//  baki_week3
//
//  Created by 박희민 on 5/9/24.
//

import UIKit

class CartViewController: UIViewController {
    
    var quantity: Int = 1
    let howmanyLabel = UILabel(frame: CGRect(x: 50, y: 200, width: 200, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setProperty()
        configureSubviews()
    }
    
    func setProperty() {
        howmanyLabel.text = "수량: \(quantity)"
    }
    
    func configureSubviews(){
        view.addSubview(howmanyLabel)
    }
}
