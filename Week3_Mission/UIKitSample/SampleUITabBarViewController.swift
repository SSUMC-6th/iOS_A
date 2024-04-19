//
//  SampleUITabBarViewController.swift
//  UIKitSample
//
//  Created by Jiwoong CHOI on 4/18/24.
//

import UIKit

class SampleUITabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground

        let sampleTableViewController = UINavigationController(rootViewController: SampleTableViewController())
        sampleTableViewController.tabBarItem.image = UIImage(systemName: "house")
        sampleTableViewController.tabBarItem.title = "TableView Controller"

        let sampleUIViewController = UINavigationController(rootViewController: SampleUIViewController())
        sampleUIViewController.tabBarItem.image = UIImage(systemName: "person")
        sampleUIViewController.tabBarItem.title = "View Controller"

        setViewControllers([sampleTableViewController, sampleUIViewController], animated: true)
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
