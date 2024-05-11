//
//  ViewController.swift
//  iOS_study_week2
//
//  Created by 김의정 on 4/16/24.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        let firstViewController = UIViewController()
        firstViewController.title = "첫 번째"
        let secondViewController = UIViewController()
        secondViewController.title = "두 번째"
        let thirdViewController = UIViewController()
        thirdViewController.title = "세 번째"
        let fourthViewController = UIViewController()
        fourthViewController.title = "네 번째"
        let fifthViewController = UIViewController()
        fifthViewController.title = "다섯 번째"
        
        // 탭바 아이템들을 탭바 컨트롤러에 연결합니다.
        let firstTab = UINavigationController(rootViewController: firstViewController)
        let secondTab = UINavigationController(rootViewController: secondViewController)
        let thirdTab = UINavigationController(rootViewController: thirdViewController)
        let fourthTab = UINavigationController(rootViewController: fourthViewController)
        let fifthTab = UINavigationController(rootViewController: fifthViewController)
        firstTab.navigationBar.prefersLargeTitles = true
        secondTab.navigationBar.prefersLargeTitles = true
        thirdTab.navigationBar.prefersLargeTitles = true
        fourthTab.navigationBar.prefersLargeTitles = true
        fifthTab.navigationBar.prefersLargeTitles = true
        
        self.viewControllers = [firstTab, secondTab, thirdTab, fourthTab, fifthTab]
    }

}

