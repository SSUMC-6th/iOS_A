//
//  ThirdViewController.swift
//  UIKitSample
//
//  Created by Jiwoong CHOI on 4/29/24.
//

import SnapKit
import UIKit

class ThirdViewController: UIViewController {
  let label: UILabel = {
    let label = UILabel()
    label.text = "Third View"
    label.textAlignment = .center
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    debugPrint("Third View: viewDidLoad")

    view.backgroundColor = .systemBackground

    view.addSubview(label)
    label.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }

    navigationItem.title = label.text
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    debugPrint("Third View: viewWillAppear")
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    debugPrint("Third View: viewDidAppear")
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    debugPrint("Third View: viewWillDisappear")
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    debugPrint("Third View: viewDidDisappear")
  }
}
