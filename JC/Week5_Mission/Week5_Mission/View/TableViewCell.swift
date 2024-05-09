//
//  SampleShowingAPIDataTableViewCell.swift
//  TableViewWithAPI
//
//  Created by Jiwoong CHOI on 4/23/24.
//

import SnapKit
import UIKit

class TableViewCell: UITableViewCell {

  // MARK: - Properties
  static let identifier = "ShowingAPIData"

  let activityUILabel: UILabel = {
    let temp = UILabel()
    return temp
  }()

  // MARK: - Cell Initailizer
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.backgroundColor = .systemBackground
    self.setupViewHierachy()
    self.setupViewLayouts()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }

  // MARK: - View Logics
  private func setupViewHierachy() {
    contentView.addSubview(activityUILabel)
  }

  private func setupViewLayouts() {
    activityUILabel.snp.makeConstraints { make in
      make.leading.equalTo(contentView.snp.leading).offset(10)
      make.centerY.equalToSuperview()
    }
  }

}
