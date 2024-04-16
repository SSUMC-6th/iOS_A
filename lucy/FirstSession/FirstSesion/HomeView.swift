//
//  HomeView.swift
//  FirstSesion
//
//  Created by 김수민 on 4/16/24.
//

import UIKit
import SnapKit

class HomeView: UIView {

    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        // required : 상속받은 View가 무조건 구현해야하는 생성자
        // init(coder:)는 인터페이스 빌더로부터 객체를 초기화 할때 사용되는 생성자
        // 따라서 스토리보드를 사용하지 않을 때는 실행환경에서 사용되어서는 안됨을 의미함.
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: 테이블뷰 추가하기
    // 1. 테이블 뷰 생성
    var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // 2. 뷰에 추가하고 오토레이아웃 잡기
    func configureSubviews() {
        self.addSubview(tableView)
        tableView.backgroundColor = .orange
    }
    
    func makeConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
}
