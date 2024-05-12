//
//  GoogleAuthViewController.swift
//  Week4_Mission
//
//  Created by Jiwoong CHOI on 5/12/24.
//

import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import SnapKit
import UIKit

class GoogleAuthViewController: UIViewController {

  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    self.setupViews()
    self.setupViewsLayout()
    
    googleAuthButton.addTarget(self, action: #selector(makeUserAuthenticationInfo), for: .touchUpInside)
  }

  // MARK: - UI Components Properties
  let googleAuthButton: UIButton = {
    let button = UIButton()
    button.setTitle("Goggle Log-In", for: .normal)
    button.layer.cornerRadius = 5
    button.backgroundColor = .systemBlue
    return button
  }()

  // MARK: - View Contraints
  private func setupViews() {
    view.addSubview(googleAuthButton)
  }

  private func setupViewsLayout() {
    googleAuthButton.snp.makeConstraints { make in
      make.width.equalTo(200)
      make.height.equalTo(30)
      make.center.equalToSuperview()
    }
  }

  // MARK: - Authentication Methods
  @objc private func makeUserAuthenticationInfo() {
    guard let clientID = FirebaseApp.app()?.options.clientID else { return }

    // Create Google Sign In configuration object.
    let config = GIDConfiguration(clientID: clientID)
    GIDSignIn.sharedInstance.configuration = config

    // Start the sign in flow!
    GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
      guard error == nil else {
        return
      }

      guard let user = result?.user,
        let idToken = user.idToken?.tokenString
      else {
        return
      }

      let credential = GoogleAuthProvider.credential(
        withIDToken: idToken,
        accessToken: user.accessToken.tokenString)

      Auth.auth().signIn(with: credential) { authResult, error in
        if let error = error {
          debugPrint(error.localizedDescription)
        }

        guard let authResult = authResult else { return }
        debugPrint(authResult)
      }

    }

  }

}
