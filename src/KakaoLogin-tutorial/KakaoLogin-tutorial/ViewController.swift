//
//  ViewController.swift
//  KakaoLogin-tutorial
//
//  Created by 홍승완 on 2022/09/27.
//

import UIKit
import SnapKit
import Combine

class ViewController: UIViewController {

    var subscriptions = Set<AnyCancellable>()
    
    lazy var kakaoLoginStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "로그인 여부 라벨"
        return label
    }()
    
//    lazy var kakaoLoginButton: UIButton = {
//        let btn = UIButton()
//        btn.setTitle("카카오 로그인", for: .normal)
//        btn.configuration = .filled()
//        btn.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        return btn
//    }()
//
//    lazy var kakaoLogoutButton: UIButton = {
//        let btn = UIButton()
//        btn.setTitle("카카오 로그아웃", for: .normal)
//        btn.configuration = .filled()
//        btn.addTarget(self, action: #selector(logoutBtnClicked), for: .touchUpInside)
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        return btn
//    }()
    
    lazy var kakaoButton = { (_ title: String, _ action: Selector) -> UIButton in
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.configuration = .filled()
        btn.addTarget(self, action: action, for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }
    
    lazy var stackView: UIStackView = {
       let stack = UIStackView()
        stack.spacing = 8
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var kakaoAuthVM: KakaoAuthVM = { KakaoAuthVM() }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        kakaoLoginStatusLabel.snp.makeConstraints { make in
            make.height.greaterThanOrEqualTo(70)
        }
        
        let kakaoLoginButton = kakaoButton("카카오 로그인", #selector(loginBtnClicked))
        let kakaoLogoutButton = kakaoButton("카카오 로그아웃", #selector(logoutBtnClicked))
        
        // 스택뷰에 label, login, logout 넣기
        stackView.addArrangedSubview(kakaoLoginStatusLabel)
        stackView.addArrangedSubview(kakaoLoginButton)
        stackView.addArrangedSubview(kakaoLogoutButton)
        
        // 스택뷰를 메인뷰에 넣기
        self.view.addSubview(stackView)
        
        // 스택뷰 autolayout 잡기
        stackView.snp.makeConstraints { make in
            make.center.equalTo(self.view)
        }
        
        setBindings()
        
    } // ViewDidLoad
    
    //MARK: - 버튼 액션
    @objc func loginBtnClicked() {
        print("LoginBtnClicked() called")
        kakaoAuthVM.KakaoLogin()
    }
    
    @objc func logoutBtnClicked() {
        print("LogoutBtnClicked() called")
        kakaoAuthVM.kakaoLogout()
    }
    
} // ViewController

// MARK: - 뷰모델 바인딩
extension ViewController {
    fileprivate func setBindings() {
        
//        self.kakaoAuthVM.$isLoggedIn.sink { [weak self] isLoggedIn in
//            guard let self = self else { return }
//            self.kakaoLoginStatusLabel.text = isLoggedIn ? "로그인 상태" : "로그아웃 상태"
//        }
//        .store(in: &subscriptions)
        
        self.kakaoAuthVM.loginStatusInfo
            .receive(on: DispatchQueue.main)
            .assign(to: \.text, on: self.kakaoLoginStatusLabel)
            .store(in: &subscriptions)
    }
}


#if DEBUG

import SwiftUI

struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        ViewController()
    }
}

struct ViewControllerRepresentable_PreviewProvider: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}

#endif

