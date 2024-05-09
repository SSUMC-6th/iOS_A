//
//  ViewController.swift
//  baki
//
//  Created by 박희민 on 4/8/24.
//
import UIKit

class ViewController: UIViewController {
    
    var selected: Int = 1
    let startButton = UIButton(type: .system)
    let howmanyLabel = UILabel()
    let plusButton = UIButton(type: .system)
    let minusButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        startButton.setTitle("장바구니 담기", for: .normal)
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        howmanyLabel.text = "\(selected)"
        howmanyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        plusButton.setTitle("+", for: .normal)
        plusButton.addTarget(self, action: #selector(increase), for: .touchUpInside)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        
        minusButton.setTitle("-", for: .normal)
        minusButton.addTarget(self, action: #selector(decrease), for: .touchUpInside)
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        
        configureSubviews()
        makeConstraints()
        
    }
    
    func makeConstraints(){
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
    
    func configureSubviews() {
        view.addSubview(startButton)
        view.addSubview(howmanyLabel)
        view.addSubview(plusButton)
        view.addSubview(minusButton)
    }
    
    @objc private func startButtonTapped() {
        let secondVC = CartViewController()
        secondVC.quantity = selected //데이터 전달하기
        navigationController?.pushViewController(secondVC, animated: true)
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

