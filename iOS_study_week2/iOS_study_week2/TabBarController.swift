//
//  File.swift
//  iOS_study_week2
//
//  Created by 김의정 on 4/16/24.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 탭바 아이템들을 생성합니다.
        let firstViewController = UIViewController()
        firstViewController.view.backgroundColor = .red
        firstViewController.title = "첫 번째"
        
        let secondViewController = UIViewController()
        secondViewController.view.backgroundColor = .green
        secondViewController.title = "두 번째"
        
        let thirdViewController = UIViewController()
        thirdViewController.view.backgroundColor = .blue
        thirdViewController.title = "세 번째"
        
        let fourthViewController = UIViewController()
        fourthViewController.view.backgroundColor = .yellow
        fourthViewController.title = "네 번째"
        
        let fifthViewController = UIViewController()
        fifthViewController.view.backgroundColor = .purple
        fifthViewController.title = "다섯 번째"
        
        // 탭바 아이템들을 탭바 컨트롤러에 연결합니다.
        let firstTab = UINavigationController(rootViewController: firstViewController)
        let secondTab = UINavigationController(rootViewController: secondViewController)
        let thirdTab = UINavigationController(rootViewController: thirdViewController)
        let fourthTab = UINavigationController(rootViewController: fourthViewController)
        let fifthTab = UINavigationController(rootViewController: fifthViewController)
        self.viewControllers = [firstTab, secondTab, thirdTab, fourthTab, fifthTab]
        
    }
}

// 앱 실행 시 초기 탭바 컨트롤러를 설정합니다.
// let tabBarController = TabBarController()
