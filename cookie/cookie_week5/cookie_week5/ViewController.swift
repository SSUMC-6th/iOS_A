import UIKit
import SnapKit
import Alamofire

class ViewController: UIViewController {

    let tempLbl = UILabel()
    let feelsLikeLbl = UILabel()
    let idLbl = UILabel()
    let mainLbl = UILabel()
    let cityNameLbl = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
        getWeather()
    }
}

extension ViewController {
    private func getWeather() {
        let url = "https://api.openweathermap.org/data/2.5/weather?appid=226b681b506d6d26dbbe00de0ccc5a1d&q=seoul&units=metric"
        
        AF.request(url).responseDecodable(of: WeatherData.self) { response in
            switch response.result {
            case .success(let weatherData):
                let temp = weatherData.main.temp
                let feelsLike = weatherData.main.feelsLike
                let id = weatherData.weather[0].id
                let main = weatherData.weather[0].main
                let cityName = weatherData.name
                
                DispatchQueue.main.async {
                    self.tempLbl.text = "temp: \(temp)"
                    self.tempLbl.backgroundColor = .lightGray
                    self.feelsLikeLbl.text = "feels_like: \(feelsLike)"
                    self.feelsLikeLbl.backgroundColor = .lightGray
                    self.idLbl.text = "id: \(id)"
                    self.idLbl.backgroundColor = .lightGray
                    self.mainLbl.text = "main: \(main)"
                    self.mainLbl.backgroundColor = .lightGray
                    self.cityNameLbl.text = "City: \(cityName)"
                    self.cityNameLbl.textColor = .blue
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
        tempLbl.text = "temp"
        feelsLikeLbl.text = "feels_Like"
        idLbl.text = "id"
        mainLbl.text = "main"
        cityNameLbl.text = "City"
    }
    final private func makeConstraints() {
        [tempLbl, feelsLikeLbl, idLbl, mainLbl, cityNameLbl].forEach {
            view.addSubview($0)
            $0.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
            }
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
        
        idLbl.snp.makeConstraints { make in
            make.top.equalTo(feelsLikeLbl.snp.bottom).offset(15)
        }
        
        mainLbl.snp.makeConstraints { make in
            make.top.equalTo(idLbl.snp.bottom).offset(15)
        }
    }
}
