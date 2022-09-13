//
//  RegisterViewController.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/12.
//

import UIKit

class RegisterViewController: UIViewController {
    // MARK: - Properties
    var email = String()
    var name = String()
    var nickName = String()
    var password  = String()
    
    // userInfo 를 클로저로 전달
    var userInfo: ((UserInfo) -> Void)?
    
    
    // 회원가입을 위한 정보제약조건
    // 유효성검사를 위한 프로퍼티
    
    // 프로퍼티 옵저버 : 해당 변수가 값을 받을 때마다 아래 메소드를 호출한다.
    // didSet : 세팅이 된 후에 아래 코드블럭을 실행하겠다.
    var isValidEmail = false {
        didSet { // 프로퍼티 옵저버 :23
            self.validateUserInfo()
        }
    }
    var isValidName = false {
        didSet { // 프로퍼티 옵저버 :
            self.validateUserInfo()
        }
    }
    var isValidNickName = false {
        didSet { // 프로퍼티 옵저버 :
            self.validateUserInfo()
        }
    }
    var isValidPassword = false {
        didSet { // 프로퍼티 옵저버 :
            self.validateUserInfo()
        }
    }
    
    // Textfields
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var popToLoginButton: UIButton!
    
    // 연산프로퍼티를 통해 한번에 모든 텍스트필드에 접근할 수 있도록 하였음
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nickNameTextField, passwordTextField]
    }
    
    // MARK: - Lifecycle
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 코드로 직접 cornerRadius 설정 가능
        // loginButton.cornerRadius = 10
        setupTextField()
        setupAttribute()
        
        // bug fix
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil
        
    }

    
    
    // MARK: - Action
    
    // Action을 코드로 구성해보았음
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            self.isValidEmail = text.isValidEmail()
            self.email = text
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
        case nickNameTextField:
            self.isValidNickName = text.count > 2
            self.nickName = text
        case passwordTextField:
            self.isValidPassword = text.isValidPassword()
            self.password = text
        default:
            fatalError("Missing TextField...")
        }
        
    }
    
    @IBAction func backButtonDidTap(_ sender: UIBarButtonItem) {
        // 뒤로가기
        self.navigationController?.popViewController(animated: true)
        
        
    }
    @IBAction func registerButtonDIdtap(_ sender: UIButton) {
        // 뒤로가기
        self.navigationController?.popViewController(animated: true)
        let userInfo = UserInfo(
            email: self.email,
            name: self.name,
            nickName: self.nickName,
            password: self.password
        )
        
        self.userInfo?(userInfo)
    }
    
    
    // MARK: - Helper
    
    private func setupTextField() {
        // self = RegisterViewController
        // addTarget은 target이 오면 누가 처리할거냐?
        // 어떤 action에 대해 누가(for)처리할거냐?
        // forEach문의 클로저를 활용함
        textFields.forEach { tf in
            tf.addTarget(self,
                         action: #selector(textFieldEditingChanged(_:)),
                         for: .editingChanged)
        }
    }
    
    // 사용자가 입력한 회원정보를 확인하고 -> UI 업데이트
    private func validateUserInfo() {
        // 유효성 properties 4개가 모두 true면 UI 업데이트하는 함수
        if isValidEmail
            && isValidName
            && isValidNickName
            && isValidPassword {
            
            self.signupButton.isEnabled = true
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.facebookColor
            }
        } else {
            self.signupButton.isEnabled = false
            UIView.animate(withDuration: 0.33) {
                self.signupButton.backgroundColor = UIColor.disabledButtonColor
            }
            
        }
    }

    private func setupAttribute() {
        // registerButton
        
        let text1 = "계정이 있으신가요?"
        let text2 = "로그인"
        
        let font1 = UIFont.systemFont(ofSize: 13)
        let font2 = UIFont.boldSystemFont(ofSize: 13)
        
        let color1 = UIColor.darkGray
        let color2 = UIColor.facebookColor
        
        let attributes = generateButtonAttribute(
            self.popToLoginButton,
            texts: text1,text2,
            fonts: font1,font2,
            colors: color1,color2)
        
        self.popToLoginButton.setAttributedTitle(attributes, for: .normal)
    }
    
}

// String 자료형에 다음 내용의 정규표현식을 확장
extension String {
    // 대문자, 소문자, 특수문자, 숫자 8자 이상일 때, -> True
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        
        return passwordValidation.evaluate(with: self)
    }
    
    // @ 2글자
    func isValidEmail() -> Bool {
        let emailRegEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEX)
        
        return emailTest.evaluate(with: self)
    }
}

