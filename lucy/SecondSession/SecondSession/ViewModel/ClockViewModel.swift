//
//  ClockViewModel.swift
//  SecondSession
//
//  Created by 김수민 on 4/26/24.
//


class ClockViewModel {
    
    var observableTime: Observable<String> = Observable("Observable")
    
    init() {
        observableTime.value = Clock.currentTime()
    }
    
    // 비지니스 로직
    func checkTime() {
        observableTime.value = Clock.currentTime()
    }
}
