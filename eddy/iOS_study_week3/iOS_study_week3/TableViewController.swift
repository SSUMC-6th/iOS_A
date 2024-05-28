//
//  TableViewController.swift
//  iOS_study_week3
//
//  Created by 김의정 on 5/7/24.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    let data = ["1번째 상품", "2번째 상품", "3번째 상품", "4번째 상품", "5번째 상품", "6번째 상품", "7번째 상품", "8번째 상품"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITableView 초기화 및 설정
        tableView = UITableView(frame: view.bounds, style: .plain)
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
    }
    
    // UITableViewDataSource 프로토콜 필수 메소드 구현
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 120
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.myLabel.text = data[indexPath.row]
        return cell
    }
    
    // UITableViewDelegate 프로토콜에서 선택적으로 구현할 수 있는 메소드
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(data[indexPath.row]) 선택됨")
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewController = ViewController()
        viewController.selectedItem = data[indexPath.row] // 선택된 아이템 설정
        navigationController?.pushViewController(viewController, animated: true)
    }
}
