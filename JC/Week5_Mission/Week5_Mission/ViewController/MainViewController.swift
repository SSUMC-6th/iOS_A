//
//  SampleShowingAPIDataTableViewController.swift
//  TableViewWithAPI
//
//  Created by Jiwoong CHOI on 4/23/24.
//

import Alamofire
import SnapKit
import UIKit

class MainViewController: UITableViewController {
  // MARK: - Properties
  var APIData: [BoredAPIModel] = []

  lazy var fetchNewDataButton: UIBarButtonItem = {
    let temp = UIBarButtonItem(
      image: UIImage(systemName: "arrow.down.circle.dotted"), style: .plain, target: self,
      action: #selector(fetchNewDataButtonTapped))
    return temp
  }()
  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(APIDataTableCell.self, forCellReuseIdentifier: APIDataTableCell.identifier)
    fetchAPIData()

    tableView.backgroundColor = .systemBackground
    navigationItem.title = "Funny Things"
    navigationItem.largeTitleDisplayMode = .automatic
    navigationController?.navigationBar.prefersLargeTitles = true

    navigationItem.rightBarButtonItem = fetchNewDataButton
  }

  // MARK: - Fetching Data Methods
  @objc func fetchNewDataButtonTapped() {
    APIData.removeAll()
      
      // 첫 번째 DispatchQueue와 DispatchGroup를 사용한 메소드
    fetchAPIData()
      
      // 두 번째 Callback을 사용하여 실시간 렌더링과 일괄 렌더링을 구현하는 메소드
      
      // 세 번째 Combine Library를 사용한 메소드
  }

  private func fetchAPIData() {
    let endPointURL = "https://www.boredapi.com/api/activity"
    let dispatchGroup = DispatchGroup()

    for _ in 0...29 {
      dispatchGroup.enter()
      AF.request(endPointURL, method: .get)
        .validate(statusCode: 200..<500)
        .responseDecodable(of: BoredAPIModel.self) { response in
          switch response.result {
          case .success(let value):
            debugPrint(value.link)

            var mutableValue = value
            if mutableValue.link == "" {
              mutableValue.link = "Maybe there are no link!"
            }

            self.APIData.append(mutableValue)

          case .failure(let error):
            print(error)
          }
          dispatchGroup.leave()
        }
    }

    dispatchGroup.notify(queue: .main) {
      self.tableView.reloadData()
    }
  }

    
  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return APIData.count
  }

  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
  {
    return 50
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    -> UITableViewCell
  {
    guard
      let cell = tableView.dequeueReusableCell(
        withIdentifier: APIDataTableCell.identifier, for: indexPath) as? APIDataTableCell
    else { return APIDataTableCell() }

    // Configure the cell...
    cell.activityUILabel.text = "\(indexPath.row + 1). \(APIData[indexPath.row].activity)"

    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let detailView: APIDetailViewController = {
      let temp = APIDetailViewController()
      temp.activity.text = APIData[indexPath.row].activity
      temp.type.text = "Type : \(APIData[indexPath.row].type)"
      temp.participants.text = "Participant : \(String(APIData[indexPath.row].participants))"
      temp.price.text = "Price : \(String(APIData[indexPath.row].price))"
      temp.link.text = "Link : \(APIData[indexPath.row].link)"
      temp.key.text = "Key : \(APIData[indexPath.row].key)"
      temp.accesibility.text = "Accesibility : \(String(APIData[indexPath.row].accessibility))"
      return temp
    }()

    navigationController?.pushViewController(detailView, animated: true)
  }
}

