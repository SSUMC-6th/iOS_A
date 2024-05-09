//
//  SecondTabBarViewController.swift
//  FirstSesion
//
//  Created by 김수민 on 4/16/24.
//

import UIKit
import SnapKit

class SecondTabBarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // SafeArea VS SuperView
        view.backgroundColor = .white
        let safeAreaView = UIView()
        safeAreaView.backgroundColor = .green
        view.addSubview(safeAreaView)
        safeAreaView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

