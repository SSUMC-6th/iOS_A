//
//  KarrotUISampleViewController.swift
//  Week2_Mission
//
//  Created by Jiwoong CHOI on 4/16/24.
//

import UIKit

class KarrotUISampleViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.systemBackground

        let homeScreen = UINavigationController(rootViewController: HomeScreenViewController())
        let ourTownScreen = UINavigationController(rootViewController: OurTownScreenViewController())
        let nearByMeScreen = UINavigationController(rootViewController: NearByMeScreenViewController())
        let chattingScreen = UINavigationController(rootViewController: ChattingScreenViewController())
        let myInfoScreen = UINavigationController(rootViewController: MyInfoScreenViewController())

        homeScreen.tabBarItem.image = UIImage(systemName: "house")
        ourTownScreen.tabBarItem.image = UIImage(systemName: "newspaper")
        nearByMeScreen.tabBarItem.image = UIImage(systemName: "mappin.and.ellipse.circle")
        chattingScreen.tabBarItem.image = UIImage(systemName: "message")
        myInfoScreen.tabBarItem.image = UIImage(systemName: "person")

        homeScreen.tabBarItem.title = "홈"
        ourTownScreen.tabBarItem.title = "동네생활"
        nearByMeScreen.tabBarItem.title = "내 근처"
        chattingScreen.tabBarItem.title = "채팅"
        myInfoScreen.tabBarItem.title = "나의 당근"

        tabBar.tintColor = UIColor.label

        setViewControllers([homeScreen, ourTownScreen, nearByMeScreen, chattingScreen, myInfoScreen], animated: true)
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
