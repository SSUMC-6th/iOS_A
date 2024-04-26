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
    
    // 1. 뷰 모델 생성(이 때 didSet이 호출해도 동작이 실행되지 않음)
    private var viewModel = ClockViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBindings()
        startTimer()
    }

    func setBindings() {
        // 클로저 변수를 설정해준다 -> Binding 한다
        // VM과 VC를 연결해주는 역할
        viewModel.didChangeTime = { [weak self] viewModel in
            self?.closureTimeLabel.text = viewModel.closureTime
        }
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            // VM 의 비지니스 로직 함수 호출
            self?.viewModel.checkTime()
        }
    }
}
