//
//  SecondViewController.swift
//  baki_week4
//
//  Created by 박희민 on 5/11/24.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {
    
    var Username: String?

    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureWelcomeLabel()
    }

    private func configureWelcomeLabel() {
        guard let username = Username else {
            return
        }
        welcomeLabel.text = "\(username) 님, 환영합니다!"
        view.addSubview(welcomeLabel)
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}

