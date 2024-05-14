//
//  ViewController.swift
//  iOS_study_week5
//
//  Created by 김의정 on 5/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    let loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 50)
        label.text = "Login"
        return label
    }()
    
    let idText: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    let passWordText: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setView()
        setConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    private func setView() {
        view.addSubview(loginLabel)
        view.addSubview(idText)
        view.addSubview(passWordText)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}

