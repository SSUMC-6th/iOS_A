//
//  FirstNavigationViewController.swift
//  UIKitSample
//
//  Created by Jiwoong CHOI on 4/29/24.
//

import SnapKit
import UIKit

class FirstViewController: UIViewController {

  let label: UILabel = {
    let label = UILabel()
    label.text = "First View"
    label.textAlignment = .center
    return label
  }()

  let button: UIButton = {
    let button = UIButton(type: .system)  // Create a system (plain) button
    button.setTitle("Go to Second View", for: .normal)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    debugPrint("FirstView : viewDidLoad")
    setupSubviews()
    setupLayout()

    navigationItem.title = label.text
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    debugPrint("FirstView : viewWillAppear")
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    debugPrint("FirstView : viewDidAppear")
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    debugPrint("FirstView : viewWillDisappear")
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    debugPrint("FirstView : viewDidDisappear")
  }

  func setupSubviews() {
    view.addSubview(label)
    view.addSubview(button)

    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
  }

  func setupLayout() {
    label.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }

    button.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(label.snp.bottom).offset(20)
    }
  }

  @objc func buttonTapped() {
    debugPrint("Button Tapped")
    let secondViewController = SecondViewController()
    navigationController?.pushViewController(secondViewController, animated: true)
  }
}
