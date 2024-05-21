//
//  ViewController.swift
//  iOS_study_week1
//
//  Created by 김의정 on 4/9/24.
//

import UIKit

class ViewController: UITabBarController {
//class ViewController: UIViewController라고 안해줘도 되나..?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .mainBackground
        
        // 첫 번째 UIView 생성
        let bannerView = UIView()
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.backgroundColor = .mainTopBanner
        self.view.addSubview(bannerView)
        
        NSLayoutConstraint.activate([
            bannerView.topAnchor.constraint(equalTo: view.topAnchor),
            bannerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bannerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bannerView.heightAnchor.constraint(equalToConstant: 180)
        ])//activate 선언위치 보기
        
        let cornerRadius: CGFloat = 25
        bannerView.layer.cornerRadius = cornerRadius
        bannerView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
//        let image1 UIImage(named: "광고1")
//        let imageView1 = UIImageView(image: image1)
//        self.view.addSubview(imageView1)
        lazy var adImangeView1: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "광고1"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        lazy var adImangeView2: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "광고2"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        lazy var imageButton1: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "버튼1"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        lazy var imageButton2: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "버튼2"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        lazy var imageButton3: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "버튼3"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        lazy var listImageView: UIImageView = {
            let imageView = UIImageView(image: UIImage(named: "리스트"))
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        self.view.addSubview(adImangeView1)
        self.view.addSubview(adImangeView2)
        self.view.addSubview(imageButton1)
        self.view.addSubview(imageButton2)
        self.view.addSubview(imageButton3)
        self.view.addSubview(listImageView)
        
        
        NSLayoutConstraint.activate([
            adImangeView1.topAnchor.constraint(equalTo: bannerView.bottomAnchor, constant: 15),
            adImangeView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            adImangeView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            adImangeView1.heightAnchor.constraint(equalToConstant: 70)
        ])
        NSLayoutConstraint.activate([
            adImangeView2.topAnchor.constraint(equalTo: listImageView.bottomAnchor, constant: 15),
            adImangeView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            adImangeView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            adImangeView2.heightAnchor.constraint(equalToConstant: 110)
        ])
        
        NSLayoutConstraint.activate([
            imageButton1.topAnchor.constraint(equalTo: adImangeView1.bottomAnchor, constant: 15),
            imageButton1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            imageButton1.heightAnchor.constraint(equalToConstant: 110),
            imageButton1.widthAnchor.constraint(equalToConstant: 110)
        ])
        NSLayoutConstraint.activate([
            imageButton2.topAnchor.constraint(equalTo: adImangeView1.bottomAnchor, constant: 15),
            imageButton2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            imageButton2.heightAnchor.constraint(equalToConstant: 110),
            imageButton2.widthAnchor.constraint(equalToConstant: 110)
        ])
        NSLayoutConstraint.activate([
            imageButton3.topAnchor.constraint(equalTo: adImangeView1.bottomAnchor, constant: 15),
            imageButton3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageButton3.heightAnchor.constraint(equalToConstant: 110),
            imageButton3.widthAnchor.constraint(equalToConstant: 110)
        ])
        
        NSLayoutConstraint.activate([
            listImageView.topAnchor.constraint(equalTo: imageButton2.bottomAnchor, constant: 15),
            listImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            listImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            listImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
}
