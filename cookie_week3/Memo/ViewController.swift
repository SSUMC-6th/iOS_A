import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var memos: [String] = []
    
    var memoTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MemoTableViewCell.self, forCellReuseIdentifier: MemoTableViewCell.identifier)

        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
        makeConstraints()
        setNavigationBar()
        
        memoTableView.dataSource = self
        memoTableView.delegate = self

        view.backgroundColor = .white
    }

    func setNavigationBar() {
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addButtonTapped))
        
        navigationItem.title = "메모장"
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addButtonTapped() {
        let addMemoViewController = AddMemoViewController()
        addMemoViewController.onMemoSaved = { [weak self] memo in
            self?.memos.append(memo) // 새 메모를 배열에 추가
            self?.memoTableView.reloadData() // 테이블 뷰 갱신
        }
        navigationController?.pushViewController(addMemoViewController, animated: true)
    }


    func configureSubviews() {
        view.addSubview(memoTableView)
    }
    
    func makeConstraints() {
        memoTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memos.count // 섹션당 행 수는 메모 배열의 길이
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MemoTableViewCell.identifier, for: indexPath) as? MemoTableViewCell else { return UITableViewCell() }
        
        cell.titleLabel.text = memos[indexPath.row] // 각 셀에 메모 제목 설정
        return cell
    }

}
