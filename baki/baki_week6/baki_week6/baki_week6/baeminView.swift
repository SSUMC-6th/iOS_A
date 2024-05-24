//
//  baeminView.swift
//  baki_week6
//
//  Created by 박희민 on 5/20/24.
//

import SwiftUI
import SnapKit

struct baeminView: View {
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    let buttonTitles = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    let imageTitles = ["menuimage1", "menuimage2", "menuimage3", "menuimage4", "menuimage5", "menuimage6", "menuimage7", "menuimage8", "menuimage9", "menuimage10"]

    var body: some View {
        VStack {
            ZStack {
                Color.mint
                    .cornerRadius(20)
                    .frame(width: screenWidth, height: 200)
                    .padding(.top, -40)
                    
                    
                VStack{
                    HStack{
                        Text("우리집")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        HStack {
                            Image(systemName:"rectangle.split.2x2")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 20,height: 20)
                            Image(systemName:"bell")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20)
                            Image(systemName: "cart")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 20, height: 20)
                            
                        }
                        .padding(.top, 10)
                        .padding(.leading, 210)
                        
                    }
                    
                    UISearchBarView(placeholder: "찾아라! 맛있는 음식과 맛집")
                        .frame(height: 40)
                        .padding(.horizontal, 20)
                }
            }
            
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(width: screenWidth - 40, height: 70)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .top, endPoint: .bottom), lineWidth: 1)
                    )
                
                Text("집콕러세요? 30% 쿠폰 드려요")
                    .font(.title3)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            
            
            HStack(spacing: 0) {
                ImageButton(buttonText: "알뜰배달")
                    
                ImageButton(buttonText: "배달")
            
                ImageButton(buttonText: "배달스토어")
                   
            }
            .padding(.horizontal,20)
            .padding(.vertical, 10)
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
                    .frame(width: screenWidth - 40, height: 200)
                VStack(spacing: 20) {
                    
                    Text("대용량특가")
                        .padding(.trailing, 270)
                    
                    
                        
                        ForEach(0..<2) { row in
                            HStack(spacing: 10) {
                                ForEach(0..<5) { col in
                                    let index = row * 5 + col
                                    if index < buttonTitles.count {
                                        MenuButton(imageName: imageTitles[index], buttonText: buttonTitles[index])
                                    }
                                }
                            }
                            
                        }
                    }
            }
            .padding(.vertical, 10)
            .background(Color.white)
            .cornerRadius(10)
            .padding(.horizontal, 20)
            
            Image("cf")
                .resizable()
                .frame(height: 150)
                .cornerRadius(20)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)

            
        }.background(Color(UIColor.systemGray5))
            .padding(.top,getSafeArea().bottom == 0 ? 150 : -100)

    }
}

struct UISearchBarView: UIViewRepresentable {
    var placeholder: String

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.placeholder = placeholder
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.backgroundColor = UIColor.white
            textField.attributedPlaceholder = NSAttributedString(string: textField.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
            textField.textColor = UIColor.black
        }
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {}
}

struct ImageButton: View {
    let screenWidth = UIScreen.main.bounds.size.width
    var imageName: String?
    var buttonText: String

    var body: some View {
        Button(action: {}) {
            if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Text(buttonText)
            }
        }
        .frame(width: (screenWidth-50)/3, height: 100)
        .background(Color.white)
        .cornerRadius(10)
        .padding(5)
        .shadow(radius: 2, x: 2, y: 2)
    }
}

struct MenuButton: View {
    let screenWidth = UIScreen.main.bounds.size.width
    var imageName: String?
    var buttonText: String

    var body: some View {
        Button(action: {}) {
            if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Text(buttonText)
            }
        }
        .frame(width: screenWidth/6, height: screenWidth/6)
        .background(Color.white)
        .cornerRadius(10)
    }
}


struct baeminView_Previews: PreviewProvider {
    static var previews: some View {
        baeminView()
    }
}

extension View{
    func getSafeArea()->UIEdgeInsets{
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    //15이상에서는 사용이 안되지만 일단 한 번 사용해봤습니다
}
