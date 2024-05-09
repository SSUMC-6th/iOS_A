//
//  SceneDelegate.swift
//  FirstSesion
//
//  Created by 김수민 on 4/16/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        // 탭 바 컨트롤러 세팅하기
        let tabBarController = UITabBarController()
        
        // 첫번째 탭 바 세팅하기
        let mainViewController = ViewController()
        let navigationController = UINavigationController(rootViewController: mainViewController)
        navigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0) // 예시로 시스템 아이템 가져왔습니다~
        
        // 두번째 탭 바 세팅하기
        let secondTabBarVC = SecondTabBarViewController()
        secondTabBarVC.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
        
        // 탭바에 컨트롤러들 추가하기
        tabBarController.viewControllers = [navigationController, secondTabBarVC]
        
        // 윈도우에 루트 뷰 컨트롤러를 탭 바 컨트롤러로 수정하기
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

