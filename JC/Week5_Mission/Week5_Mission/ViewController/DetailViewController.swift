//
//  APIDetailViewController.swift
//  TableViewWithAPI
//
//  Created by Jiwoong CHOI on 4/23/24.
//

import SnapKit
import UIKit

class DetailViewController: UIViewController {
  
  // MARK: - UI Components
  var activity: UILabel = {
    let temp = UILabel()
    temp.text = "activity"
    return temp
  }()

  var type: UILabel = {
    let temp = UILabel()
    temp.text = "type"
    return temp
  }()

  let participants: UILabel = {
    let temp = UILabel()
    temp.text = "participants"
    return temp
  }()

  var price: UILabel = {
    let temp = UILabel()
    temp.text = "price"
    return temp
  }()

  var key: UILabel = {
    let temp = UILabel()
    temp.text = "key"
    return temp
  }()

  var link: UILabel = {
    let temp = UILabel()
    temp.text = "link"
    return temp
  }()

  var accesibility: UILabel = {
    let temp = UILabel()
    temp.text = "accsibility"
    return temp
  }()
  
  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    view.backgroundColor = .systemBackground

    setupView()
    setupViewLayout()
  }

  // MARK: - View Logic
  private func setupView() {
    view.addSubviews(
      activity,
      type,
      participants,
      price,
      key,
      link,
      accesibility
    )
  }

  private func setupViewLayout() {
    activity.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.centerY.equalTo(view.safeAreaLayoutGuide.snp.top)
    }

    type.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.top.equalTo(activity.snp.bottom).offset(10)
    }

    participants.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.top.equalTo(type.snp.bottom).offset(10)
    }

    price.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.top.equalTo(participants.snp.bottom).offset(10)
    }

    link.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.top.equalTo(price.snp.bottom).offset(10)
    }

    key.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.top.equalTo(link.snp.bottom).offset(10)
    }

    accesibility.snp.makeConstraints { make in
      make.leading.equalToSuperview().offset(20)
      make.top.equalTo(key.snp.bottom).offset(10)
    }
  }

}
