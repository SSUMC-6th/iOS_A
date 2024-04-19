//
//  SampleCollectionViewCell.swift
//  UIKitSample
//
//  Created by Jiwoong CHOI on 4/15/24.
//

import UIKit

class SampleCollectionViewCell: UICollectionViewCell {
    var sampleGraphics: UIView = {
       var sampleGraphics = UIView()
        sampleGraphics.backgroundColor = UIColor.systemBackground
        return sampleGraphics
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    private func setUpUI() {
        contentView.addSubview(sampleGraphics)
        sampleGraphics.snp.makeConstraints { make in
            make.width.equalTo(contentView.snp.width)
            make.height.equalTo(contentView.snp.height)
        }
    }
}
