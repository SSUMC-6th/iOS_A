//
//  SecondViewController.swift
//  FirstSesion
//
//  Created by 김수민 on 4/16/24.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {

    var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        return label
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureSubview()
        makeConstraints()
    }
    

    func configureSubview() {
        self.view.addSubviews(titleLabel)
    }
    
    func makeConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}
