//
//  MenuTableViewCell.swift
//  week3
//
//  Created by 박희민 on 5/7/24.
//


import UIKit

class CartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("CartViewController - viewWillAppear()")
        // 뷰가 나타나기 전에 필요한 작업 수행
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("CartViewController - viewDidAppear()")
        // 뷰가 완전히 나타난 후에 필요한 작업 수행
    }
}
