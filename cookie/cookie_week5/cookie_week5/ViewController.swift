import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {

    let tempLbl = UILabel()
    let feelsLikeLbl = UILabel()
    let mainLbl = UILabel()
    let cityNameLbl = UILabel()
    let cityTextField = UITextField()
    let searchButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }

    // 도시 이름을 파라미터로 받는 getWeather 메서드로 수정
    private func getWeather(for city: String) {
        let url = "https://api.openweathermap.org/data/2.5/weather?appid=226b681b506d6d26dbbe00de0ccc5a1d&q=\(city)&units=metric"
        
        AF.request(url).responseDecodable(of: WeatherData.self) { response in
            switch response.result {
            case .success(let weatherData):
                let temp = weatherData.main.temp
                let feelsLike = weatherData.main.feelsLike
                let main = weatherData.weather[0].main
                let cityName = weatherData.name
                
                DispatchQueue.main.async {
                    self.cityNameLbl.text = "City: \(cityName)"
                    self.cityNameLbl.textColor = .blue
                    self.tempLbl.text = "Temp: \(temp)"
                    self.tempLbl.backgroundColor = .lightGray
                    self.feelsLikeLbl.text = "Feels like: \(feelsLike)"
                    self.feelsLikeLbl.backgroundColor = .lightGray
                    self.mainLbl.text = "Weather: \(main)"
                    self.mainLbl.backgroundColor = .lightGray
                }
            case .failure(let error):
                print("Request error: \(error)")
            }
        }
    }
}

// MARK: - UI
extension ViewController {
    final private func configureUI() {
        setAttributes()
        makeConstraints()
    }
    final private func setAttributes() {
        
        cityTextField.placeholder = "Enter city name"
        cityTextField.borderStyle = .roundedRect
        
        searchButton.setTitle("Search", for: .normal)
        searchButton.backgroundColor = .blue
        searchButton.addTarget(self, action: #selector(searchWeather), for: .touchUpInside)
        
        tempLbl.text = "Temp"
        feelsLikeLbl.text = "Feels like"
        mainLbl.text = "Weather"
        cityNameLbl.text = "City"
    }
    final private func makeConstraints() {
        view.addSubview(cityTextField)
        view.addSubview(searchButton)
        [tempLbl, feelsLikeLbl, mainLbl, cityNameLbl].forEach {
            view.addSubview($0)
            $0.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
            }
        }
        cityTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
                
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(cityTextField.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
        }
        
        cityNameLbl.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-60)
        }
        
        tempLbl.snp.makeConstraints { make in
            make.top.equalTo(cityNameLbl.snp.bottom).offset(15)
        }
        
        feelsLikeLbl.snp.makeConstraints { make in
            make.top.equalTo(tempLbl.snp.bottom).offset(15)
        }
        
        mainLbl.snp.makeConstraints { make in
            make.top.equalTo(feelsLikeLbl.snp.bottom).offset(15)
        }
    }
    
    @objc private func searchWeather() {
        if let city = cityTextField.text, !city.isEmpty {
            getWeather(for: city) // 사용자가 입력한 도시 이름으로 getWeather 호출
        }
    }
}
