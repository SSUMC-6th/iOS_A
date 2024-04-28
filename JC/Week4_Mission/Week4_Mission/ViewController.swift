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
  // MARK: - UI Elements
  
  // Username text field
  private let usernameTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Username"
    textField.borderStyle = .roundedRect
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()

  // Password text field
  private let passwordTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Password"
    textField.borderStyle = .roundedRect
    textField.isSecureTextEntry = true
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()

  // Sign In button
  private lazy var signInButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Sign In", for: .normal)
    button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  // Sign Up button
  private lazy var signUpButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("Sign Up", for: .normal)
    button.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .systemBackground

    setupViews()
    setupConstraints()
  }

  // MARK: - UI Setup
  
  // Add UI elements to the view
  private func setupViews() {
    view.addSubview(usernameTextField)
    view.addSubview(passwordTextField)
    view.addSubview(signInButton)
    view.addSubview(signUpButton)
  }

  // Set up constraints for UI elements
  private func setupConstraints() {
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

  // MARK: - Button Actions
  
  // Handle sign in button tapped event
  @objc private func signInButtonTapped() {
    guard let username = usernameTextField.text, let password = passwordTextField.text else {
      return
    }

    Auth.auth().signIn(withEmail: username, password: password) { [weak self] authResult, error in
      if let error = error {
        // Display error message on the screen
        let alertController = UIAlertController(title: "에러", message: "이메일이나 비밀번호가 틀립니다.", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self?.present(alertController, animated: true, completion: nil)
      } else {
        print("Sign in successful")
        let profileVC = ProfileViewController()
        self?.present(profileVC, animated: true, completion: nil)
      }
    }
  }

  // Handle sign up button tapped event
  @objc private func signUpButtonTapped() {
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
