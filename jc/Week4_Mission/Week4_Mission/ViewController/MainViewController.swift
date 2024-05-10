//
//  ViewController.swift
//  Week4_Mission
//
//  Created by Jiwoong CHOI on 5/10/24.
//

import SnapKit
import UIKit

class MainViewController: UIViewController {

  // MARK: - Properties
  let emailTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "이메일을 입력하세요"
    textField.borderStyle = .roundedRect
    return textField
  }()

  let passwordTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "비밀번호를 입력하세요"
    textField.borderStyle = .roundedRect
    textField.isSecureTextEntry = true
    return textField
  }()

  let loginButton: UIButton = {
    let button = UIButton()
    button.setTitle("로그인", for: .normal)
    button.backgroundColor = .systemBlue
    button.layer.cornerRadius = 5

    return button
  }()

  let signUpButton: UIButton = {
    let button = UIButton()
    button.setTitle("회원가입", for: .normal)
    button.backgroundColor = .systemBlue
    button.layer.cornerRadius = 5

    return button
  }()

  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground
    loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    signUpButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)

    setupViews()
    setupLayout()
  }

  // MARK: - Helpers
  func setupViews() {
    view.addSubview(emailTextField)
    view.addSubview(passwordTextField)
    view.addSubview(loginButton)
    view.addSubview(signUpButton)
  }

  func setupLayout() {
    emailTextField.snp.makeConstraints { make in
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
      make.left.equalTo(view).offset(20)
      make.right.equalTo(view).offset(-20)
    }

    passwordTextField.snp.makeConstraints { make in
      make.top.equalTo(emailTextField.snp.bottom).offset(20)
      make.left.right.equalTo(emailTextField)
    }

    loginButton.snp.makeConstraints { make in
      make.top.equalTo(passwordTextField.snp.bottom).offset(20)
      make.left.right.equalTo(emailTextField)
      make.height.equalTo(50)
    }

    signUpButton.snp.makeConstraints { make in
      make.top.equalTo(loginButton.snp.bottom).offset(20)
      make.left.right.equalTo(emailTextField)
      make.height.equalTo(50)
    }
  }

  @objc func loginButtonTapped() {
    guard let inputEmailString = emailTextField.text,
      let inputPasswordString =
        passwordTextField.text
    else { return }

    let presavedEmailString = UserDefaults.standard.string(forKey: inputEmailString)
    let presavedPasswordString = UserDefaults.standard.string(forKey: inputPasswordString)

    if inputEmailString == presavedEmailString && inputPasswordString == presavedPasswordString {
      let profileView = ProfileLoginedViewController()
      profileView.emailLabel.text = inputEmailString

      self.present(profileView, animated: true)
    } else {
      debugPrint("Something wrong...!")
    }

  }

  @objc func signupButtonTapped() {
    guard let emailString = emailTextField.text,
      let passwordString =
        passwordTextField.text
    else { return }

    UserDefaults.standard.set(emailString, forKey: emailString)
    UserDefaults.standard.set(passwordString, forKey: passwordString)

    debugPrint("Info saved...!")
  }

}

// MARK: - Preview
#if canImport(SwiftUI) && DEBUG
  import SwiftUI

  struct MainViewController_Preview: PreviewProvider {
    static var previews: some View {
      ViewControllerRepresentable().edgesIgnoringSafeArea(.all)
    }
  }

  struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> MainViewController {
      return MainViewController()
    }

    func updateUIViewController(_ uiViewController: MainViewController, context: Context) {
      // leave this empty
    }
  }
#endif
