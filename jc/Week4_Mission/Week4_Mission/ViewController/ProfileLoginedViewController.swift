//
//  ProfileLoginedViewController.swift
//  Week4_Mission
//
//  Created by Jiwoong CHOI on 5/10/24.
//

import SnapKit
import UIKit

class ProfileLoginedViewController: UIViewController {
  // MARK: - UI Components
  let emailLabel: UILabel = {
    let label = UILabel()
    return label
  }()

  let logoutButton: UIButton = {
    let button = UIButton()
    button.setTitle("로그아웃", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)

    return button
  }()

  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground

    setupViews()
    setupLayouts()

    logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
  }

  // MARK: - Helpers
  private func setupViews() {
    view.addSubview(emailLabel)
    view.addSubview(logoutButton)
  }

  private func setupLayouts() {
    emailLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }

    logoutButton.snp.makeConstraints { make in
      make.top.equalTo(emailLabel.snp.bottom).offset(20)
      make.centerX.equalTo(emailLabel)
    }
  }

  // MARK: - Button Actions
  @objc func logoutButtonTapped() {
    self.dismiss(animated: true) {
      debugPrint("Logout success...!")
    }
  }

}
