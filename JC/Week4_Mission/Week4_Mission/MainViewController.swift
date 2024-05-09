//
//  ViewController.swift
//  Week4_Mission
//
//  Created by Jiwoong CHOI on 4/28/24.
//

import FirebaseAuth
import SnapKit
import UIKit

class MainViewController: UIViewController {
  // MARK: - UI Components
  private let usernameTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Username"
    textField.borderStyle = .roundedRect
    return textField
  }()

  private let passwordTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Password"
    textField.borderStyle = .roundedRect
    textField.isSecureTextEntry = true
    return textField
  }()

  private lazy var signInButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Sign In", for: .normal)
    button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    return button
  }()

  private lazy var signUpButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Sign Up", for: .normal)
    button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    return button
  }()

  // MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground

    setupViews()
    setupViewLayouts()
    setNavigation()
  }

  // MARK: - View Logics
  private func setupViews() {
    view.addSubview(usernameTextField)
    view.addSubview(passwordTextField)
    view.addSubview(signInButton)
    view.addSubview(signUpButton)
  }
  private func setupViewLayouts() {
    usernameTextField.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview().offset(-50)
      make.width.equalTo(200)
      make.height.equalTo(40)
    }

    passwordTextField.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(usernameTextField.snp.bottom).offset(20)
      make.width.equalTo(200)
      make.height.equalTo(40)
    }

    signInButton.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(passwordTextField.snp.bottom).offset(20)
    }

    signUpButton.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(signInButton.snp.bottom).offset(20)
    }
  }
  private func setNavigation() {
    navigationController?.title = "Settings"
  }

  // MARK: - Button Actions
  @objc private func signInButtonTapped() {
    guard let username = usernameTextField.text, let password = passwordTextField.text else {
      return
    }

    Auth.auth().signIn(withEmail: username, password: password) { authResult, error in

      if let error = error {
        let alertController = UIAlertController(
          title: "에러", message: error.localizedDescription, preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "확인", style: .default))

        self.present(alertController, animated: true)

      } else {
        debugPrint("로그인 성공")

        let profileViewController = ProfileViewController()

      }
    }
  }

  @objc private func signUpButtonTapped() {
    guard let username = usernameTextField.text, let password = passwordTextField.text else {
      return
    }

    Auth.auth().createUser(withEmail: username, password: password) { authResult, error in
      if let error = error {
        debugPrint("회원가입 에러: \(error.localizedDescription)")

        let alertController = UIAlertController(
          title: "회원가입 에러!", message: error.localizedDescription, preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "확인", style: .default))

        self.present(alertController, animated: true)

      } else {

        let alertController = UIAlertController(
          title: "회원가입 성공", message: nil, preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "확인", style: .default))

        self.present(alertController, animated: true)
      }
    }
  }
}
