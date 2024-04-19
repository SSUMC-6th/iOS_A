//
//  TestingDataTransferViewController.swift
//  UIKitSample
//
//  Created by Jiwoong CHOI on 4/19/24.
//

import SnapKit
import UIKit

class TestingDataTransferViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        view.addSubview(transferData)
        transferData.snp.makeConstraints { make in
            make.center.equalTo(view.snp.center)
        }
    }

    let transferData: UILabel = {
        let transferData = UILabel()
        return transferData
    }()
    
    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
