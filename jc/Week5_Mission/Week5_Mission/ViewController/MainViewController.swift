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
  var Data: [BoredDataModel] = []
  let numberOfData = 30

  // MARK: - UI Components
  lazy var fetchNewDataButton: UIBarButtonItem = {
    let temp = UIBarButtonItem(
      image: UIImage(systemName: "arrow.down.circle.dotted"), style: .plain, target: self,
      action: #selector(fetchNewDataButtonTapped))
    return temp
  }()

  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
    tableView.backgroundColor = .systemBackground
    self.setupNavigation()

    BoredServer.shared.fetchData(numberOfData: self.numberOfData) { responseData in
      self.Data = responseData
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }

  }

  // MARK: - View Logics
  private func setupNavigation() {
    navigationItem.title = "Funny Things"
    navigationItem.largeTitleDisplayMode = .automatic
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.rightBarButtonItem = fetchNewDataButton
  }

  // MARK: - Button Actions
  @objc func fetchNewDataButtonTapped() {
    Data.removeAll()

    BoredServer.shared.fetchData(numberOfData: self.numberOfData) { responseData in
      self.Data = responseData
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }

  // MARK: - Table view data source
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Data.count
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
        withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell
    else { return TableViewCell() }

    // Configure the cell...
    cell.activityUILabel.text = "\(indexPath.row + 1). \(Data[indexPath.row].activity)"

    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let data = Data[indexPath.row]

    let detailViewController: DetailViewController = {
      let temp = DetailViewController()
      temp.activity.text = data.activity
      temp.type.text = "Type : \(data.type)"
      temp.participants.text = "Participant : \(data.participants))"
      temp.price.text = "Price : \(data.price))"
      temp.link.text = "Link : \(data.link)"
      temp.key.text = "Key : \(data.key)"
      temp.accesibility.text = "Accesibility : \(data.accessibility)"
      return temp
    }()

    navigationController?.pushViewController(detailViewController, animated: true)
  }
}
