//
//  LoginViewController.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/12.
//

import UIKit

class LoginViewController: UIViewController {

    var email: String = ""
    var password: String = ""
    var userInfo: UserInfo?
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAttribute()
    }

    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        // 옵셔널
        // 값이 있을수도 없을수도 있음
        let text = sender.text ?? ""
//        if text.isValidEmail() {
//            self.loginButton.backgroundColor = .facebookColor
//        } else {
//            self.loginButton.backgroundColor = .disabledButtonColor
//        }
        // email 조건식 맞추면 버튼색 변함
        self.loginButton.backgroundColor = text.isValidEmail() ? .facebookColor : .disabledButtonColor
        
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        // 비밀번호 2글자이상 치면 로그인버튼 색 바뀜
        self.loginButton.backgroundColor
        = text.count > 2 ? .facebookColor : .disabledButtonColor
        
        self.password = text
    }
    
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        // 회원가입 정보를 전달받아서, 그것과 textField 데이터가 일치하면,
        // 로그인이 되어야 한다.
        
        // 옵셔널이므로 guard let 이용
        guard let userInfo = self.userInfo else {
            return // userInfo 자체가 없으면 리턴됨
        }
        if userInfo.email == self.email
            && userInfo.password == self.password {
            // 로그인 성공시
            let vc = storyboard?.instantiateViewController(withIdentifier: "TestVC") as! TestViewController
            //self.present(vc, animated: true, completion: nil) // modal로 화면전환
            navigationController?.pushViewController(vc, animated: true) // pushView로 화면전환
        } else {
            // 로그인 실패시?
            // ...
        }
    }
    
    @IBAction func registerDidTap(_ sender: UIButton) {
        // 화면전환
        // 1. 스토리보드를 생성
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // 2. 뷰컨트롤러 생성
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterViewController
        
        // 3. 화면전환 메소드를 이용해서 화면을 전환
        // modal로 아래서 위로 animate
//        self.present(registerViewController, animated: true, completion: nil)
        // 옆으로 push하여 view가 등장
        self.navigationController?.pushViewController(registerViewController, animated: true)
        
        // registerVC에서 저장한 userInfo를 불러옴 (수신)
        // 클로저를 사용할때는 참조에 대한 문제가 발생할 수 있으므로 [weak self]와
        // self.userInfo를 self?.userInfo로 바꿔줌
        // 약한참조로 바꿔주어서 ARC를 낮춰주면서 메모리가 해제될때 같이 이부분도
        // 해제되도록 해줌 -> ARC 나중에 공부할 때 신경써서 공부해보면 좋을 듯
        registerViewController.userInfo = { [weak self](userInfo) in
            // LoginVC의 userInfo에 전달받은 userInfo를 저장함
            self?.userInfo = userInfo
        }
        
    }
    
    private func setupAttribute() {
        // registerButton
        
        let text1 = "계정이 없으신가요?"
        let text2 = "가입하기"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(
            self.registerButton,
            texts: text1,text2,
            fonts: font1,font2,
            colors: color1,color2)
        
        self.registerButton.setAttributedTitle(attributes, for: .normal)
    }
    
}
