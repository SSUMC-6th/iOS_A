//
//  ViewController.swift
//  SecondSession
//
//  Created by 김수민 on 4/26/24.
//

import UIKit

// 뷰 컨트롤러 (ViewController)
class ViewController: UIViewController {
    
    @IBOutlet weak var closureTimeLabel: UILabel!
    @IBOutlet weak var observableTimeLabel: UILabel!
    @IBOutlet weak var combineTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
    }
    
    // 매 초마다 시간을 업데이트
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.closureTimeLabel.text = Clock.currentTime()
        }
    }
}
