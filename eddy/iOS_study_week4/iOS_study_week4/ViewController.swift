//
//  ViewController.swift
//  iOS_study_week4
//
//  Created by 김의정 on 5/7/24.
//

import UIKit

class ViewController: UIViewController {
    
    var idString: String?
    var passWordString: String?
    
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
        textField.placeholder = "ID"
        return textField
    }()
    
    let passWordText: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "PW"
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = CGFloat(5)
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let createAccountButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("회원가입", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = CGFloat(5)
        button.addTarget(self, action: #selector(createAccountButtonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setView()
        setConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func loginButtonPressed() {
        // 텍스트 필드에서 입력한 값을 저장합니다.
        let id = idText.text ?? ""
        let password = passWordText.text ?? ""
        let checkID = UserDefaults.standard.string(forKey: "ID")
        let checkPASSWORD = UserDefaults.standard.string(forKey: "PASSWORD")
        
        if id == checkID && password == checkPASSWORD {
            loginLabel.text = "로그인 성공"
        } else if id == checkID && password != checkPASSWORD {
            loginLabel.text = "비밀번호 불일치"
        } else {
            loginLabel.text = "존재하지 않는 ID"
        }
    }
    
    @objc func createAccountButtonPressed() {
        // 텍스트 필드에서 입력한 값을 저장합니다.
        let id = idText.text ?? ""
        let password = passWordText.text ?? ""
        let checkID = UserDefaults.standard.string(forKey: "ID")
        
        if id == checkID {
            loginLabel.text = "이미 존재하는 ID"
        } else {
            UserDefaults.standard.set(id, forKey: "ID")
            UserDefaults.standard.set(password, forKey: "PASSWORD")
            
            loginLabel.text = "회원가입 성공"
        }
    }
    
    private func setView() {
        view.addSubview(loginLabel)
        view.addSubview(idText)
        view.addSubview(passWordText)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
    }

    private func setConstraints() {
        NSLayoutConstraint.activate([
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            loginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            idText.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 150),
            idText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            idText.widthAnchor.constraint(equalToConstant: 250),
            idText.heightAnchor.constraint(equalToConstant: 50),
            
            passWordText.topAnchor.constraint(equalTo: idText.bottomAnchor, constant: 20),
            passWordText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passWordText.widthAnchor.constraint(equalToConstant: 250),
            passWordText.heightAnchor.constraint(equalToConstant: 50),
            
            loginButton.topAnchor.constraint(equalTo: passWordText.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 250),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            createAccountButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createAccountButton.widthAnchor.constraint(equalToConstant: 250),
            createAccountButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
