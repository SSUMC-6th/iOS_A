//
//  ViewController.swift
//  baki
//
//  Created by 박희민 on 4/8/24.
//

import UIKit

import SnapKit


class ViewController: UIViewController{
    
    
    lazy var mainlabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemMint
        label.layer.masksToBounds = true
        label.layer.cornerRadius=20.0
        return label
    }()
    
    let menuImageView = UIImageView(image: UIImage(named: "menu"))
    let bellImageView = UIImageView(image: UIImage(named: "bell"))
    let cartImageView = UIImageView(image: UIImage(named: "cart"))

    
    lazy var cplabel : UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .black
        label.text = "배달 쿠폰 받아가세요"
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor.purple.cgColor
        label.layer.borderWidth = 1
        label.layer.cornerRadius=10.0
        return label
    }()
    
    var searchBar : UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "찾아라! 맛있는 음식과 맛집"
        if let textfield = search.value(forKey: "searchField") as? UITextField {

            textfield.backgroundColor = UIColor.white

            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
 
            textfield.textColor = UIColor.black
        }
        return search
    }()
    
    lazy var button1 : UIButton = {
        let button: UIButton = UIButton (type: .system)
        let image = UIImage(named: "deliver1")?.withRenderingMode(.alwaysOriginal)
        
        button.backgroundColor = .white
        button.layer.cornerRadius = 10.0
        button.setImage(image, for: .normal)
        button.layer.shadowOffset = CGSize()
        
        return button
    }()
    
    lazy var button2 : UIButton = {
        let button: UIButton = UIButton (type: .system)
        button.setTitle("deliver2", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10.0
        button.layer.shadowOffset = CGSize()
        return button
    }()
    
    lazy var button3 : UIButton = {
        let button: UIButton = UIButton (type: .system)
        button.setTitle("store", for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10.0
        button.layer.shadowOffset = CGSize()
        return button
    }()
    
 
    lazy var menu_label : UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.layer.masksToBounds = true
        label.layer.cornerRadius=10.0
        return label
    }()
    

    lazy var text1 : UILabel = {
        let label = UILabel()
        label.text = "배민 배달"
        label.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        
        return label
    }()
    
    
    lazy var cf : UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "cf")?.withRenderingMode(.alwaysOriginal)
        button.setImage(image, for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.layer.masksToBounds = true
        button.layer.cornerRadius=20.0
        return button
    }()
        
    var searchtab : UITabBar = {
        let tabbar : UITabBar = UITabBar()
        let item1 = UITabBarItem(title: "검색", image: UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), tag: 0)
        let item2 = UITabBarItem(title: "찜", image: UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal), tag: 1)
        let item3 = UITabBarItem(title: "배민", image: UIImage(named: "baemin")?.withRenderingMode(.alwaysOriginal), tag: 2)
        let item4 = UITabBarItem(title: "주문내역", image: UIImage(named: "log")?.withRenderingMode(.alwaysOriginal), tag: 3)
        let item5 = UITabBarItem(title: "my배민", image: UIImage(named: "my")?.withRenderingMode(.alwaysOriginal), tag: 4)

        tabbar.setItems([item1, item2, item3, item4, item5], animated: false)
        tabbar.backgroundColor = .white
        return tabbar
    }()

    func addSubViews() {
        view.addSubview(mainlabel)
        view.addSubview(menuImageView)
        view.addSubview(bellImageView)
        view.addSubview(cartImageView)
        view.addSubview(cplabel)
        view.addSubview(searchBar)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(text1)
        view.addSubview(menu_label)
        view.addSubview(cf)
        view.addSubview(searchtab)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        
        addSubViews()
        setupConstraints()
        createButtons()
        
    }

    private func setupConstraints() {
        mainlabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(-50)
            make.leading.equalToSuperview().offset(0)
            make.trailing.equalToSuperview().offset(0)
            make.height.equalTo(200)
        }

        
        
        searchBar.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(90)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(350)
            make.height.equalTo(40)
            
        }
        
        menuImageView.snp.makeConstraints { make in
            make.bottom.equalTo(mainlabel.snp.top).offset(130)
            make.leading.equalToSuperview().offset(280)
            make.width.height.equalTo(20)
        }

        
        bellImageView.snp.makeConstraints { make in
            make.centerY.equalTo(menuImageView)
            make.leading.equalTo(menuImageView.snp.trailing).offset(10)
            make.width.height.equalTo(20)
        }

        cartImageView.snp.makeConstraints { make in
            make.centerY.equalTo(menuImageView)
            make.leading.equalTo(bellImageView.snp.trailing).offset(10)
            make.width.height.equalTo(20)
        }
        
        cplabel.snp.makeConstraints{ make in
            make.top.equalTo(mainlabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(350)
            make.height.equalTo(70)
        }
        
        button1.snp.makeConstraints{ make in
            make.top.equalTo(cplabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(110)
            make.height.equalTo(100)
        }
        
        button2.snp.makeConstraints{ make in
            make.top.equalTo(cplabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(110)
            make.height.equalTo(100)
        }
        
        button3.snp.makeConstraints{ make in
            make.top.equalTo(cplabel.snp.bottom).offset(10)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(110)
            make.height.equalTo(100)
        }
        
        text1.snp.makeConstraints{ make in
            make.top.equalTo(button1.snp.bottom).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-200)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }

        
        
        menu_label.snp.makeConstraints{ make in
            make.top.equalTo(button1.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(350)
            make.height.equalTo(200)
        }
        
        cf.snp.makeConstraints{ make in
            make.top.equalTo(menu_label.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(350)
            make.height.equalTo(100)
            
        }
        
        searchtab.snp.makeConstraints{make in
            make.bottom.equalToSuperview().offset(10)
            make.left.right.equalToSuperview() // 화면 좌우에 꽉 차도록 설정
            make.height.equalTo(130)
        }
    }

                             
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
    
    func createButtons() {
            let buttonTitles = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
            let imageTitles = ["menuimage1","menuimage2","menuimage3","menuimage4","menuimage5","menuimage6","menuimage7","menuimage8","menuimage9","menuimage10"]
            var buttons = [UIButton]()
            
            for (index, title) in buttonTitles.enumerated() {
                let button = UIButton(type: .system)
                button.setTitle(title, for: .normal)
                if index < imageTitles.count {
                    let imageName = imageTitles[index]
                    if let image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal) {
                        button.setImage(image, for: .normal)
                    }
                }
                button.backgroundColor = .systemGray5
                button.layer.cornerRadius = 10.0
                button.layer.shadowOffset = CGSize(width: 2.0, height: 2.0) // Set shadow offset
                buttons.append(button)
                menu_label.addSubview(button)
            }
            
            for (index, button) in buttons.enumerated() {
                if index < 5 {
                    button.snp.makeConstraints { make in
                        make.top.equalToSuperview().offset(50)
                        make.leading.equalToSuperview().offset(20 + (65 * index))
                        make.width.equalTo(50)
                        make.height.equalTo(50)
                    }
                } else {
                    button.snp.makeConstraints { make in
                        make.top.equalToSuperview().offset(110)
                        make.leading.equalToSuperview().offset(20 + (65 * (index - 5)))
                        make.width.equalTo(50)
                        make.height.equalTo(50)
                    }
                }
            }
        }
}


