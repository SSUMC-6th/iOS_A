//
//  SampleShowingAPIDataTableViewCell.swift
//  TableViewWithAPI
//
//  Created by Jiwoong CHOI on 4/23/24.
//

import SnapKit
import UIKit

class APIDataTableCell: UITableViewCell {
  static let identifier = "ShowingAPIData"

  let activityUILabel: UILabel = {
    let temp = UILabel()
    return temp
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.backgroundColor = .systemBackground

    contentView.addSubview(activityUILabel)
    activityUILabel.snp.makeConstraints { make in
      make.leading.equalTo(contentView.snp.leading).offset(10)
      make.centerY.equalToSuperview()
    }
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
}
