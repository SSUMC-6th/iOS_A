//
//  SampleTableViewCell.swift
//  UIKitSample
//
//  Created by Jiwoong CHOI on 4/15/24.
//

import SnapKit
import UIKit

class SampleTableViewCell: UITableViewCell {
    static let identifier = "SampleTableViewCell"

    let sampleText: UILabel = {
        let sampleText = UILabel()
        return sampleText
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(sampleText)
        sampleText.snp.makeConstraints { make in
            make.edges.equalTo(contentView.snp.edges)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
}
