//
//  SecondNavigationViewController.swift
//  UIKitSample
//
//  Created by Jiwoong CHOI on 4/29/24.
//

import SnapKit
import UIKit

class SecondViewController: UIViewController {

  // MARK: - Properties
  let label: UILabel = {
    let label = UILabel()
    label.text = "Second View"
    label.textAlignment = .center
    return label
  }()

  let button: UIButton = {
    let button = UIButton(type: .system)  // Create a system (plain) button
    button.setTitle("Go to Third View", for: .normal)
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    return button
  }()

  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground

    self.setSubViews()
    self.setViewsLayout()
    self.setNavigation()
  }

  // MARK: - Methods
  private func setSubViews() {
    view.addSubview(label)
    view.addSubview(button)
  }

  private func setViewsLayout() {
    label.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }

    button.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(label.snp.bottom).offset(20)
    }
  }

  private func setNavigation() {
    navigationItem.title = label.text
  }

  @objc private func buttonTapped() {
    let thirdViewController = ThirdViewController()
    thirdViewController.label.text = "Third View"
    navigationController?.pushViewController(thirdViewController, animated: true)
  }
}
