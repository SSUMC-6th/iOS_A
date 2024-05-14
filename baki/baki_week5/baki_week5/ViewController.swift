//
//  ViewController.swift
//  baki_week5
//
//  Created by 박희민 on 5/12/24.
//

import UIKit
import SnapKit
import Moya  //->alamofire의 단점 보완
//import Alamofire

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

    let provider = MoyaProvider<WeatherService>()  //모든 네트워크 서비스와 상호작용할 때 만들고 사용하는 객체

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
            make.top.equalTo(view.safeAreaLayoutGuide).offset(100)
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
        provider.request(.getWeather(city: city)) { result in
            switch result {
            case .success(let response): //성공하면(응답을 받았을 때)
                do {
                    let weatherResponse = try response.map(WeatherResponse.self)
                    let temperature = String(format: "%.1f", weatherResponse.main.temp)
                    let weatherInfo = "\(city)의 현재 온도: \(temperature) ℃\n\(city)의 날씨 상태: \(weatherResponse.weather[0].description)"
                    self.weatherLabel.text = weatherInfo
                } catch {
                    print("Failed to parse weather data: \(error)")
                }
            case .failure(let error):
                print("Network error: \(error.localizedDescription)")
            }
        }
    }
}


enum WeatherService {
    case getWeather(city: String)   //클라이언트가 서버에 보낼 데이터
}

extension WeatherService: TargetType {
    //서버의 endpoint 도메인
    var baseURL: URL {
        return URL(string: "https://api.openweathermap.org/data/2.5")!
    }
    
    //도메인 뒤에 추가될 경로
    var path: String {
        switch self {
        case .getWeather:
            return "/weather"
        }
    }
    
    //get, post, put, delete
    var method: Moya.Method {
        return .get
    }

    //자신만의 인코딩 유형대로 정의된 파라미터 전달할 때
    var task: Task {
        switch self {
        case .getWeather(let city):
            let apiKey = "c3ea73a2cd4b35eb23650b5436498d7e"
            return .requestParameters(parameters: ["q": city, "appid": apiKey, "units": "metric"], encoding: URLEncoding.default)
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}

