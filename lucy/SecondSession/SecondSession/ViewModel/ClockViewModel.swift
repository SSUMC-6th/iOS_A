//
//  ClockViewModel.swift
//  SecondSession
//
//  Created by 김수민 on 4/26/24.
//

// 뷰-모델 (ViewModel)

// 0. 뷰-모델 제작하기
class ClockViewModel {
    
    // 클로저 변수(didSet함수) : ViewController에서의 수행 동작을 담음
    var didChangeTime: ((ClockViewModel) -> Void)?
    
    
    var closureTime: String {
        didSet {
            didChangeTime?(self)
        }
    }
    
    init() {
        closureTime = Clock.currentTime()
    }
    
    // 비지니스 로직
    func checkTime() {
        closureTime = Clock.currentTime()
    }
}
