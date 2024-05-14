//
//  GoogleAuthLoginedViewController.swift
//  Week4_Mission
//
//  Created by Jiwoong CHOI on 5/12/24.
//

import FirebaseAuth
import SnapKit
import SwiftUI
import UIKit

class GoogleAuthLoginedViewController: UIViewController {

  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground

    self.setupViews()
    self.setupViewsLayout()

    self.fetchInfoFromFirebase()
    logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
  }

  // MARK: - Methods
  func fetchInfoFromFirebase() {
    guard let user = Auth.auth().currentUser else { return }

    emailLabel.text = user.email
  }

  // MARK: - Button Actions
  @objc func logoutButtonTapped() {
    let firebaseAuth = Auth.auth()

    do {
      try firebaseAuth.signOut()
      debugPrint("Log-out successfully...!")
      UserDefaults.standard.removeObject(forKey: "currentUserUID")
      guard
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
      else { return }
      sceneDelegate.window?.rootViewController = GoogleAuthViewController()
    } catch {
      debugPrint("Error occured in signing out...!")
    }
  }

  // MARK: - UI Components Properties
  let emailLabel: UILabel = {
    let label = UILabel()
    label.text = "Hello World"
    return label
  }()

  let logoutButton: UIButton = {
    let button = UIButton()
    button.setTitle("Log-out", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .white
    button.layer.borderWidth = 1
    button.layer.cornerRadius = 5
    return button
  }()

  // MARK: - UI Componenets Layout
  func setupViews() {
    view.addSubview(emailLabel)
    view.addSubview(logoutButton)
  }

  func setupViewsLayout() {
    emailLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }

    logoutButton.snp.makeConstraints { make in
      make.width.equalTo(200)
      make.height.equalTo(30)
      make.top.equalTo(emailLabel.snp.bottom).offset(20)
      make.centerX.equalToSuperview()
    }
  }

}

// MARK: - Preview
struct GoogleAuthLoginedViewControllerPreview: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> GoogleAuthLoginedViewController {
    return GoogleAuthLoginedViewController()
  }

  func updateUIViewController(_ uiViewController: GoogleAuthLoginedViewController, context: Context)
  {
    // Leave this empty
  }
}

struct GoogleAuthLoginedViewController_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      GoogleAuthLoginedViewControllerPreview()
    }
  }
}
