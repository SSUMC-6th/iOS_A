//
//  ViewController.swift
//  baki_week5
//
//  Created by 박희민 on 5/12/24.
//


import UIKit
import SnapKit
import Alamofire

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
    
    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
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
        view.addSubview(weatherLabel)
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
        
        weatherLabel.snp.makeConstraints { make in
                    make.top.equalTo(WeatherButton.snp.bottom).offset(20)
                    make.left.right.equalToSuperview().inset(20)
                }
    }


    @objc func WeatherButtonTapped() {
        let city = cityTextField.text ?? ""
        fetchWeather(for: city)
    }
    
    func fetchWeather(for city: String) {
            let apiKey = "c3ea73a2cd4b35eb23650b5436498d7e"
            let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"

            AF.request(urlString).responseDecodable(of: WeatherResponse.self) { response in
                switch response.result {
                case .success(let weatherResponse):
                    // 날씨 정보와 온도를 라벨에 표시
                    let temperature = String(format: "%.1f", weatherResponse.main.temp)
                    let weatherInfo = "\(city)의 현재 온도: \(temperature) ℃\n\(city)의 날씨 상태: \(weatherResponse.weather[0].description)"
                    self.weatherLabel.text = weatherInfo
                case .failure(let error):
                    print("Network error: \(error.localizedDescription)")
                }
            }
        }
    
    
}

