//
//  ViewController.swift
//  FirstSesion
//
//  Created by 김수민 on 4/16/24.
//

import UIKit

class ViewController: UIViewController {
    var homeView: HomeView = HomeView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    func setView() {
        self.view = homeView
        // viewDidLoad에서 delegate, dataSource를 view에 위임해주기
        homeView.tableView.dataSource = self
        homeView.tableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: UITableViewDataSource {
    // numberOfRowsInSection : tableView에 몇 개의 cell을 띄울 건지 개수(int)를 정해주는 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // cellForRowAt : tableView에 어떤 tableViewCell을 사용할건지 정해주는 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomUITableViewCell.identifier,
               for: indexPath) as? CustomUITableViewCell else { return CustomUITableViewCell() }
        let titleText = "제목\(indexPath.row)"
        let subTitleText = "부제목\(indexPath.row)"
        let prize = "가격\(indexPath.row)"
        cell.titleLabel.text = titleText
        cell.subtitleLabel.text = subTitleText
        cell.prizeLabel.text = prize
        return CustomUITableViewCell()
    }
}
