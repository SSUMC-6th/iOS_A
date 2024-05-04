//
//  homeViewController.swift
//  baki_week2
//
//  Created by 박희민 on 5/5/24.
//

import UIKit

class homeViewController: UIViewController {
    
    lazy var tableView = UITableView(frame: .zero, style:  .plain) //style : plain, grouped, insetGrouped
    
    let data = [[("Test 1-1","homeimage1"),("Test 1-2","homeimage1"),("Test 1-3","homeimage1"),("Test 1-4","homeimage1")],[("Test 2-1","homeimage1"),("Test 2-2","homeimage1"),("Test 2-3","homeimage1")],[("Test 3-1","homeimage1"),("Test 3-2","homeimage1")]]
    let header = ["Section 1","Section 2","Section 3"]
    var selectedIndexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(self.tableView)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)])

        // Do any additional setup after loading the view.
    }
    

}

extension homeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return header.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return header[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: .none)
        let (text, imageName) = data[indexPath.section][indexPath.row]
        cell.textLabel?.text = text
        cell.imageView?.image = UIImage(named: imageName)
        return cell
    }
    
    func reusetableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let (text, imageName) = data[indexPath.section][indexPath.row]
        cell.textLabel?.text = text
        cell.imageView?.image = UIImage(named: imageName)
        return cell
    } //재사용 cell 가져오기
}

extension homeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 이전에 선택한 셀이 있으면 색상을 되돌림
        if let previousSelectedIndexPath = selectedIndexPath {
            tableView.cellForRow(at: previousSelectedIndexPath)?.backgroundColor = .clear
        }

        // 현재 선택한 셀의 배경색을 변경
        tableView.cellForRow(at: indexPath)?.backgroundColor = .systemGray3

        // 이전에 선택한 셀의 인덱스를 업데이트
        selectedIndexPath = indexPath
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 //tableview 각 크기
    }
}
