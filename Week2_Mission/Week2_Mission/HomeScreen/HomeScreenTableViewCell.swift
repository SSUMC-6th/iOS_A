//
//  HomeScreenTableViewCell.swift
//  Week2_Mission
//
//  Created by Jiwoong CHOI on 4/16/24.
//

import SnapKit
import UIKit

class HomeScreenTableViewCell: UITableViewCell {
    static let identifier = "HomeScreenTableCellId"

    let sampleImage: UIView = {
        let sampleImage = UIView()
        sampleImage.backgroundColor = UIColor.systemOrange
        sampleImage.layer.cornerRadius = 10
        return sampleImage
    }()

    let sampleProductName: UILabel = {
        let sampleText = UILabel()
        sampleText.text = "당근마켓 항목 텍스트 목업 데이터"
        return sampleText
    }()

    let sampleLocation: UILabel = {
        let sampleLocation = UILabel()
        sampleLocation.text = "서울특별시 동작구"
        return sampleLocation
    }()
    
    let sampleUploadedDate: UILabel = {
        let sampleUploadedDate = UILabel()
        sampleUploadedDate.text = "3일전"
        return sampleUploadedDate
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setUpUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setUpUI()
    }

    private func setUpUI() {
        contentView.addSubview(sampleImage)
        contentView.addSubview(sampleProductName)
        contentView.addSubview(sampleLocation)
        contentView.addSubview(sampleUploadedDate)

        contentView.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }

        sampleImage.snp.makeConstraints { make in
            make.width.height.equalTo(70)
            make.centerY.equalTo(contentView.snp.centerY)
            make.leading.equalTo(contentView.snp.leading).offset(30)
        }

        sampleProductName.snp.makeConstraints { make in
            make.top.equalTo(sampleImage.snp.top)
            make.leading.equalTo(sampleImage.snp.trailing).offset(20)
        }
    }
}
