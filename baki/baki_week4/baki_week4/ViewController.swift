//
//  ViewController.swift
//  baki_week4
//
//  Created by 박희민 on 5/11/24.
//
import UIKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    private var idTextField: UITextField = {
        let idTextField = UITextField()
        idTextField.attributedPlaceholder = NSAttributedString(
                string: "아이디",
                attributes:  [
                    .foregroundColor : UIColor.black
                ]
        )
        
        idTextField.borderStyle = . roundedRect
        idTextField.clearButtonMode = .always
        
        return idTextField
        
    }()
    
    lazy var pwTextField: UITextField = {
        let pwTextField = UITextField()
        pwTextField.attributedPlaceholder = NSAttributedString(
                string: "비밀번호",
                attributes:  [
                    .foregroundColor : UIColor.black
                ]
        )
        pwTextField.borderStyle = . roundedRect
        pwTextField.clearButtonMode = .always
        pwTextField.isSecureTextEntry = true
        
        return pwTextField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        makeConstraints()
        view.backgroundColor = .white
    }
    
    func configureSubviews(){
        view.addSubview(idTextField)
        view.addSubview(pwTextField)
    }
    
    func makeConstraints(){
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(100)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(30)
        }
        
        pwTextField.snp.makeConstraints { make in
              make.top.equalTo(idTextField.snp.bottom).offset(20)
              make.leading.equalToSuperview().offset(50)
              make.trailing.equalToSuperview().offset(-50)
              make.height.equalTo(30)
          }
    }
    
}

