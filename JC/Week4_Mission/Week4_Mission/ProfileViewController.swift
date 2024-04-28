import FirebaseAuth
import SnapKit
import UIKit

class ProfileViewController: UIViewController {
  let emailLabel: UILabel = {
    let label = UILabel()
    label.text = Auth.auth().currentUser?.email
    label.textAlignment = .center
    return label
  }()

  lazy var logoutButton: UIButton = {
    let button = UIButton()
    button.setTitle("Logout", for: .normal)
    button.setTitleColor(.systemBlue, for: .normal)
    button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)

    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground

    view.addSubview(emailLabel)
    view.addSubview(logoutButton)

    emailLabel.snp.makeConstraints { make in
      make.center.equalToSuperview()
    }

    logoutButton.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(emailLabel.snp.bottom).offset(20)
    }
  }

  @objc func logoutButtonTapped() {
    do {
      try Auth.auth().signOut()
      self.dismiss(animated: true, completion: nil)
    } catch {
      print("Error signing out: \(error)")
    }
  }
}
