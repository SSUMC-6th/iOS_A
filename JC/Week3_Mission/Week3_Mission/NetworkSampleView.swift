//
//  ViewController.swift
//  Week3_Mission
//
//  Created by Jiwoong CHOI on 4/22/24.
//

import Alamofire
import SnapKit
import UIKit

class NetworkSampleView: UINavigationController {
    let sampleUILabel: UILabel = {
        let temp = UILabel()
        return temp
    }()

    let sampleUIImage: UIImageView = {
        let temp = UIImageView(image: UIImage(systemName: "heart.fill"))
        return temp
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let endPointUrl = "https://www.boredapi.com/api/activity"

        AF.request(endPointUrl, method: .get)
            .validate(statusCode: 200 ..< 500)
            .responseDecodable(of: BoredAPIModel.self) { response in
                switch response.result {
                case .success(let value):
                    guard let temp = response.value else { return }
                    self.sampleUILabel.text = "Activity : \(value.activity)"
                    print("Activity: \(temp.activity)")
                case .failure(let error):
                    print(error)
                }
            }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground

        view.addSubview(sampleUIImage)
        sampleUIImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(view.snp.leading).offset(10)
        }

        view.addSubview(sampleUILabel)
        sampleUILabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(sampleUIImage.snp.trailing).offset(10)
        }
    }
}
