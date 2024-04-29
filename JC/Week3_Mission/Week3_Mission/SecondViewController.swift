//
//  SecondNavigationViewController.swift
//  UIKitSample
//
//  Created by Jiwoong CHOI on 4/29/24.
//

import SnapKit
import UIKit

class SecondViewController: UIViewController {

  let label: UILabel = {
    let label = UILabel()
    label.text = "Second View"
    label.textAlignment = .center
    return label
  }()

  let button: UIButton = {
    let button = UIButton(type: .system)  // Create a system (plain) button
    button.setTitle("Go to Third View", for: .normal)
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    debugPrint("Second View: viewDidLoad")

    view.backgroundColor = .systemBackground

    view.addSubview(label)
    label.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }

    navigationItem.title = label.text

    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    view.addSubview(button)
    button.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(label.snp.bottom).offset(20)
    }
  }

  @objc func buttonTapped() {
    let thirdViewController = ThirdViewController()
    navigationController?.pushViewController(thirdViewController, animated: true)
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    debugPrint("Second View: viewWillAppear")
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    debugPrint("Second View: viewDidAppear")
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    debugPrint("Second View: viewWillDisappear")
  }
}
