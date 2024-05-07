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
    return button
  }()

  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    debugPrint("Life Cycle: viewDidLoad")

    view.addSubview(label)
    label.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }

    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

    view.addSubview(button)
    button.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(label.snp.bottom).offset(20)
    }

    navigationItem.title = label.text

  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    debugPrint("Life Cycle: viewWillAppear")
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    debugPrint("Life Cycle: viewDidAppear")
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    debugPrint("Life Cycle: viewWillDisappear")
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    debugPrint("Life Cycle: viewDidDisappear")
  }

  // MARK: - Methods
  @objc func buttonTapped() {
    debugPrint("Button Tapped")
    let firstViewController = FirstViewController()
    firstViewController.label.text = "First View"
    navigationController?.pushViewController(firstViewController, animated: true)
  }
}
