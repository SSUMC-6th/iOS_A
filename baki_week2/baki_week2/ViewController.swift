//
//  ViewController.swift
//  baki
//
//  Created by 박희민 on 4/8/24.
//

import UIKit

class ViewController: UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.tabBar.tintColor = .systemCyan
        self.tabBar.backgroundColor = .systemGray5
        setTabUI()
    }
    
    private func setTabUI() {
        let vc1 = homeViewController()
        let vc2 = liveViewController()
        let vc3 = aroundViewController()
        let vc4 = chatViewController()
        let vc5 = myViewController()
        
        //vc1.title = "Home"
        vc2.title = "Live"
        vc3.title = "Around"
        vc4.title = "Chat"
        vc5.title = "Carrot"
        
        //vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        vc3.navigationItem.largeTitleDisplayMode = .always
        vc4.navigationItem.largeTitleDisplayMode = .always
        vc5.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        let nav4 = UINavigationController(rootViewController: vc4)
        let nav5 = UINavigationController(rootViewController: vc5)
        
        nav1.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "동네생활", image: UIImage(systemName: "newspaper"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "내 근처", image: UIImage(systemName: "location"), tag: 3)
        nav4.tabBarItem = UITabBarItem(title: "채팅", image: UIImage(systemName: "message"), tag: 4)
        nav5.tabBarItem = UITabBarItem(title: "나의 당근", image: UIImage(systemName: "person"), tag: 5)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        nav4.navigationBar.prefersLargeTitles = true
        nav5.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1, nav2, nav3, nav4, nav5], animated: false)
    }
 
}

