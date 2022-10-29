//
//  ViewController.swift
//  AutoLayout-code-tutorial
//
//  Created by 홍승완 on 2022/10/29.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var moveUpBtn = { () -> UIButton in
        let btn = UIButton()
        btn.setTitle("위로 올리기", for: .normal)
        btn.setTitleColor(.black ,for: .normal)
        btn.backgroundColor = .white
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.layer.cornerRadius = 10
        return btn
    }
    
    lazy var someView = { ()-> UIView in
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10
        return view
    }()
    
    var btnTopConstraint : Constraint? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "MY_YELLOW")
        
        //let myView = someView
        self.view.addSubview(someView)
        
        let myButton = moveUpBtn()
        myButton.addTarget(self, action: #selector(moveViewUp), for: .touchUpInside)
        

        self.view.addSubview(myButton)
        
        myButton.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        someView.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            self.btnTopConstraint = make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(750).constraint
        }
   
    }
    
    var offset = 750
    
    @objc func moveViewUp() {
        offset-=50
        self.btnTopConstraint?.update(offset: offset)
        UIViewPropertyAnimator(duration: 0.8, curve: .easeOut, animations: self.view.layoutIfNeeded).startAnimation()
    }
    
}

// MARK: - previewProvider
#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // leave this empty
    }
    
    @available (iOS 13.0.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
    }
}
@available(iOS 13.0, *)
struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .edgesIgnoringSafeArea(.all)
    }
} #endif
