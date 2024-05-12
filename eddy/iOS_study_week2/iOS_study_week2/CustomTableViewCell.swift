//
//  CustomTableViewCell.swift
//  iOS_study_week2
//
//  Created by 김의정 on 5/6/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let myLabel = UILabel()
    
    lazy var ImangeView1: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Image1"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(ImangeView1)
        contentView.addSubview(myLabel)
        
        myLabel.font = UIFont.systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            ImangeView1.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ImangeView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            ImangeView1.heightAnchor.constraint(equalToConstant: 110),
            ImangeView1.widthAnchor.constraint(equalToConstant: 110)
        ])
        
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            myLabel.leadingAnchor.constraint(equalTo: ImangeView1.trailingAnchor, constant: 10)
        ])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
