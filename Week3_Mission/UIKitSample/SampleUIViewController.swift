//
//  SampleViewController.swift
//  UIKitSample
//
//  Created by Jiwoong CHOI on 4/4/24.
//

import SnapKit
import UIKit

class SampleUIViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.systemBackground

        navigationItem.title = "UIView Controller"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
