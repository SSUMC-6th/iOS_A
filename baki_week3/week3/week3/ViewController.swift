//
//  ViewController.swift
//  baki
//
//  Created by 박희민 on 4/8/24.
//
import UIKit

class ViewController: UIViewController {
    
    var selected: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let startButton = UIButton(type: .system)
        startButton.setTitle("장바구니 담기", for: .normal)
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        let howmanyLabel = UILabel()
        howmanyLabel.text = "\(selected)"
        howmanyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let plusButton = UIButton(type: .system)
        plusButton.setTitle("+", for: .normal)
        plusButton.addTarget(self, action: #selector(increase), for: .touchUpInside)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        
        let minusButton = UIButton(type: .system)
        minusButton.setTitle("-", for: .normal)
        minusButton.addTarget(self, action: #selector(decrease), for: .touchUpInside)
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(startButton)
        view.addSubview(howmanyLabel)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
        
        NSLayoutConstraint.activate([
            howmanyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            howmanyLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            plusButton.topAnchor.constraint(equalTo: howmanyLabel.bottomAnchor, constant: 20),
            plusButton.rightAnchor.constraint(equalTo: view.centerXAnchor, constant: -20),
            plusButton.widthAnchor.constraint(equalToConstant: 50),
            plusButton.heightAnchor.constraint(equalToConstant: 30),
            
            minusButton.topAnchor.constraint(equalTo: howmanyLabel.bottomAnchor, constant: 20),
            minusButton.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
            minusButton.widthAnchor.constraint(equalToConstant: 50),
            minusButton.heightAnchor.constraint(equalToConstant: 30),
            
            startButton.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: 40),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

    }
    
    
    @objc private func startButtonTapped() {
        let secondVC = CartViewController()
        secondVC.quantity = selected //데이터 전달하기
        navigationController?.pushViewController(secondVC, animated: true)
    }
    
    
    //인터페이스 빌더와 소스 코드 연결...
    @IBAction func selecthowmanyButtonTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "수량 선택", message: nil, preferredStyle: .actionSheet)
        
        for i in 1...10 {
            let action = UIAlertAction(title: "\(i)", style: .default) { _ in
                self.selected = i
            }
            alertController.addAction(action)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc private func increase() {
        selected += 1
        updatehowmanyLabel()
    }
    
    @objc private func decrease() {
        if selected > 1 {
            selected -= 1
            updatehowmanyLabel()
        }
    }
    
    private func updatehowmanyLabel() {
        if let howmanyLabel = view.subviews.compactMap({ $0 as? UILabel }).first {
            howmanyLabel.text = "\(selected)"
        }
    }
}
