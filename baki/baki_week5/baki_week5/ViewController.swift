//
//  ViewController.swift
//  baki_week5
//
//  Created by 박희민 on 5/12/24.
//


import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var cityTextField: UITextField = {
        let cityTextField = UITextField()
        cityTextField.attributedPlaceholder = NSAttributedString(
                string: "도시",
                attributes:  [
                    .foregroundColor : UIColor.black
                ]
        )
        
        cityTextField.borderStyle = .roundedRect
        cityTextField.clearButtonMode = .always
        cityTextField.autocapitalizationType = .none
        
        return cityTextField
        
    }()
    
    private lazy var WeatherButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("날씨", for: .normal)
            button.addTarget(self, action: #selector(WeatherButtonTapped), for: .touchUpInside)
            return button
        }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        configureSubviews()
        makeConstraints()
    }
    
    func configureSubviews() {
        view.addSubview(cityTextField)
        view.addSubview(WeatherButton)
    }

    func makeConstraints() {
        cityTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100) // 상단에서 100만큼 떨어지도록 수정
            make.width.equalTo(200)
        }

        WeatherButton.snp.makeConstraints { make in
            make.top.equalTo(cityTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }


    @objc func WeatherButtonTapped() {
        let city = cityTextField.text ?? ""
        
    }
}
