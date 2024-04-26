//
//  Observable.swift
//  SecondSession
//
//  Created by 김수민 on 4/26/24.
//


class Observable<T> { // Observable = 관찰자
    typealias Listener = (T?) -> Void
    
    var listener: Listener?// 클로저 (동작) = VC의 값을 바꾸어줌

    var value: T? {
        didSet {
            self.listener?(value)
        }
    }
    
    init(_ value: T?) {
        self.value = value
    }
    
    func bind(_ listener: @escaping Listener) {
        listener(value)
        self.listener = listener
    }
}
