//
//  ViewController.swift
//  Week4_Mission
//
//  Created by Jiwoong CHOI on 4/28/24.
//

import FirebaseAuth
import SnapKit
import UIKit

class ViewController: UIViewController {
  private let usernameTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Username"
    textField.borderStyle = .roundedRect
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()

  private let passwordTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Password"
    textField.borderStyle = .roundedRect
    textField.isSecureTextEntry = true
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()

  private let signInButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Sign In", for: .normal)
    button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  private let signUpButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Sign Up", for: .normal)
    button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .systemBackground

    view.addSubview(usernameTextField)
    view.addSubview(passwordTextField)
    view.addSubview(signInButton)
    view.addSubview(signUpButton)

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

  @objc private func signInButtonTapped() {
    // Handle sign in button tapped event
    guard let username = usernameTextField.text, let password = passwordTextField.text else {
      return
    }

    Auth.auth().signIn(withEmail: username, password: password) { [weak self] authResult, error in
      if let error = error {
        print("Sign in error: \(error.localizedDescription)")
      } else {
        print("Sign in successful")
        let profileVC = ProfileViewController()
        self?.present(profileVC, animated: true, completion: nil)
      }
    }
  }

  @objc private func signUpButtonTapped() {
    // Handle sign up button tapped event
    guard let username = usernameTextField.text, let password = passwordTextField.text else {
      return
    }

    Auth.auth().createUser(withEmail: username, password: password) {
      [weak self] authResult, error in
      if let error = error {
        // Handle sign up error
        print("Sign up error: \(error.localizedDescription)")
      } else {
        // Sign up successful
        print("Sign up successful")
      }
    }
  }
}
