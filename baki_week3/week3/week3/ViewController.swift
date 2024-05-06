//
//  ViewController.swift
//  baki
//
//  Created by 박희민 on 4/8/24.
//
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        let startButton = UIButton(type: .system)
        startButton.setTitle("Go to Second VC", for: .normal)
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func startButtonTapped() {
        let secondVC = CartViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}
