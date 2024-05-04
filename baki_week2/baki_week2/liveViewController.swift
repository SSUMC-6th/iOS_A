//
//  liveViewController.swift
//  baki_week2
//
//  Created by 박희민 on 5/4/24.
//
import UIKit

class liveViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 스크롤 뷰 생성
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white // 스크롤 뷰의 배경색을 하얀색으로 설정
        view.addSubview(scrollView)
        
        // 스크롤 뷰의 제약 조건 설정
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // 스크롤 뷰의 컨텐츠 사이즈 설정
        scrollView.contentSize = CGSize(width: view.frame.width, height: view.frame.height * 2)
        
        // 스크롤 뷰 안에 라벨 추가
        for i in 0..<10 {
            let label = UILabel()
            label.text = "Label \(i + 1)"
            label.textAlignment = .center
            label.backgroundColor = .white // 각 라벨의 배경색을 하얀색으로 설정
            label.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(label)
            
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: CGFloat(100 * i)),
                label.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                label.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                label.heightAnchor.constraint(equalToConstant: 100)
            ])
        }
    }
}
