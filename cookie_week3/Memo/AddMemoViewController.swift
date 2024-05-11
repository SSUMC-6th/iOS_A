import UIKit
import SnapKit

class AddMemoViewController: UIViewController {
    
    lazy var textField: UITextField = { //lazy var -> 한 번만 초기화
        let textField = UITextField()
        textField.placeholder = "메모 입력하는 곳"
        textField.borderStyle = .roundedRect // 텍스트 필드에 테두리 추가
        return textField
    }()

    var onMemoSaved: ((String) -> Void)? // 콜백 함수 선언

        @objc func writeButtonTapped() {
            if let text = textField.text, !text.isEmpty {
                onMemoSaved?(text) // 메모를 전달하고 콜백 실행
            }
        navigationController?.popViewController(animated: true) // 화면을 이전 뷰로 돌아가기
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "메모 작성"
        
        // 네비게이션 아이템에 버튼 추가
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "작성하기", style: .done, target: self, action: #selector(writeButtonTapped))
        
        configureSubviews()
        makeConstraints()
    }
    
    func configureSubviews() {
        view.addSubview(textField)
    }
    
    func makeConstraints() {
        textField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20) // Safe area의 상단에서 20pt 아래
            make.left.equalTo(view).offset(20)  // 뷰의 왼쪽에서 20pt
            make.right.equalTo(view).offset(-20) // 뷰의 오른쪽에서 20pt 내려감
            make.height.equalTo(50) // 높이를 50pt로 설정
        }
    }

}
