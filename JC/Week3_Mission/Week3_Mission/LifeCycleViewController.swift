//
//  TestingAsyncProgrammingViewController.swift
//  UIKitSample
//
//  Created by Jiwoong CHOI on 4/29/24.
//

import SnapKit
import UIKit

class LifeCycleViewController: UIViewController {
  // MARK: - Properties
  let label: UILabel = {
    let label = UILabel()
    label.text = "Life Cycle"
    label.textAlignment = .center
    return label
  }()

  let button: UIButton = {
    let button = UIButton(type: .system)  // Create a system (plain) button
    button.setTitle("Go to First View", for: .normal)
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    return button
  }()

  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    self.setSubViews()
    self.setViewsLayout()
    self.setNavigation()
  }

  // MARK: - Methods
  private func setNavigation() {
    navigationItem.title = label.text
  }

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

  @objc private func buttonTapped() {
    debugPrint("Button Tapped")
    let firstViewController = FirstViewController()
    firstViewController.label.text = "First View"
    navigationController?.pushViewController(firstViewController, animated: true)
  }
}
