//
//  CustomUITableViewCell.swift
//  FirstSesion
//
//  Created by 김수민 on 4/16/24.
//

import UIKit

class CustomUITableViewCell: UITableViewCell {
    //MARK: property
    static let identifier = "lucyTableViewCell"

    var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    var subtitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var prizeLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    var cellImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dummyImage")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    //MARK: init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureSubviews()
         makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    //MARK: View Setting
    func configureSubviews() {
        contentView.addSubviews(titleLabel, subtitleLabel, prizeLabel, cellImage)
    }
    
    func makeConstraints() {
        cellImage.snp.makeConstraints { make in
            make.leading.top.equalTo(contentView).inset(5)
            make.width.height.equalTo(80)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(cellImage.snp.trailing).offset(20)
            make.top.equalTo(cellImage)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
        }
        
        prizeLabel.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(contentView).inset(10)
        }
    }
}
