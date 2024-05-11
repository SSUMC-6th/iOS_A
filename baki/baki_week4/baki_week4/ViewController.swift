//
//  ViewController.swift
//  baki_week4
//
//  Created by 박희민 on 5/11/24.
//
import UIKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var selected: Int = 1
    
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
        idTextField.autocapitalizationType = .none
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
        pwTextField.autocapitalizationType = .none
        return pwTextField
    }()
    
    private lazy var loginButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("로그인", for: .normal)
            button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
            return button
        }()
    
    private lazy var signUpButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("회원가입", for: .normal)
            button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
            return button
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
        view.addSubview(loginButton)
        view.addSubview(signUpButton)
    }
    
    // 레이아웃
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
        
        loginButton.snp.makeConstraints { make in
              make.top.equalTo(pwTextField.snp.bottom).offset(20)
              make.leading.equalToSuperview().offset(50)
              make.trailing.equalToSuperview().offset(-50)
              make.height.equalTo(30)
          }
        
        signUpButton.snp.makeConstraints { make in
              make.top.equalTo(loginButton.snp.bottom).offset(20)
              make.leading.equalToSuperview().offset(50)
              make.trailing.equalToSuperview().offset(-50)
              make.height.equalTo(30)
          }
    }
    
    @objc private func loginButtonTapped() {
        // 입력된 아이디와 비밀번호 가져오기
        let inputUsername = idTextField.text ?? ""
        let inputPassword = pwTextField.text ?? ""
        
        // 입력값이 비어 있는지 확인
        if inputUsername.isEmpty || inputPassword.isEmpty {
            let alertController = UIAlertController(title: "입력 필요", message: "아이디와 비밀번호를 입력해주세요.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        
        // UserDefaults에 저장된 아이디와 비밀번호 가져오기
        let savedUsername = UserDefaults.standard.string(forKey: "username") ?? ""
        let savedPassword = UserDefaults.standard.string(forKey: "password") ?? ""
        
        // 입력된 아이디와 비밀번호가 UserDefaults에 저장된 값과 일치하는지 확인
        if inputUsername == savedUsername && inputPassword == savedPassword {
            //일치하면 다음 화면으로 이동
            let secondVC = SecondViewController()
            secondVC.Username = inputUsername
            navigationController?.pushViewController(secondVC, animated: true)
        }
        else {
            let alertController = UIAlertController(title: "로그인 실패", message: "아이디 또는 비밀번호가 일치하지 않습니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    }

    
    @objc private func signUpButtonTapped() {
        let username = idTextField.text ?? ""
        let password = pwTextField.text ?? ""
        
        // UserDefaults에 저장
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.set(password, forKey: "password")
        
        let alertController = UIAlertController(title: "회원가입 성공", message: "회원가입 성공!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
}
