//
//  ThirdViewController.swift
//  UIKitSample
//
//  Created by Jiwoong CHOI on 4/29/24.
//

import SnapKit
import UIKit

class ThirdViewController: UIViewController {

  // MARK: - Properties

  let label: UILabel = {
    let label = UILabel()
    label.text = "Third View"
    label.textAlignment = .center
    return label
  }()

  // MARK: - Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    debugPrint("Third View: viewDidLoad")

    view.backgroundColor = .systemBackground

    self.setNavigation()
    self.setSubViews()
    self.setViewsLayout()

  }

  // MARK: - Methods

  private func setNavigation() {
    navigationItem.title = label.text
  }

  private func setSubViews() {
    view.addSubview(label)
  }

  private func setViewsLayout() {
    label.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }
  }
}
