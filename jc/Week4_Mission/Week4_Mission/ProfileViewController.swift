import FirebaseAuth
import SnapKit
import UIKit

class ProfileViewController: UIViewController {

  // MARK: - Properties
  private let emailLabel: UILabel = {
    let label = UILabel()
    label.text = Auth.auth().currentUser?.email
    label.textAlignment = .center
    return label
  }()

  private lazy var logoutButton: UIButton = {
    let button = UIButton()
    button.setTitle("Logout", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
    return button
  }()

  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground

    self.setupViews()
    self.setupViewsLayouts()
  }

  // MARK: - View Logics
  private func setupViews() {
    view.addSubview(emailLabel)
    view.addSubview(logoutButton)
  }

  private func setupViewsLayouts() {
    emailLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }

    logoutButton.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(emailLabel.snp.bottom).offset(20)
    }
  }

  // MARK: - Button Actions
  @objc func logoutButtonTapped() {
    do {
      try Auth.auth().signOut()
      debugPrint("로그아웃 성공")
    } catch {
      debugPrint("로그아웃 간 에러 발생 : \(error.localizedDescription)")
    }
  }
}
