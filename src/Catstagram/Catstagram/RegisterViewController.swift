//
//  RegisterViewController.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/12.
//

import UIKit

class RegisterViewController: UIViewController {
    
    // MARK: - Properties
    
    // 회원가입을 위한 정보제약조건
    // 유효성검사를 위한 프로퍼티
    var isValidEmail = false
    var isValidName = false
    var isValidNickName = false
    var isValidPassword = false
    
    // Textfields
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nickNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // 연산프로퍼티를 통해 한번에 모든 텍스트필드에 접근할 수 있도록 하였음
    var textFields: [UITextField] {
        [emailTextField, nameTextField, nickNameTextField, passwordTextField]
    }
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextField()
    }

    
    
    // MARK: - Action
    
    // Action을 코드로 구성해보았음
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case emailTextField:
            //print("email: \(sender.text ?? "")") // == text
            print(text)
        case nameTextField:
            print("name: \(sender.text ?? "")")
        case nickNameTextField:
            print("nickName: \(sender.text ?? "")")
        case passwordTextField:
            print("password: \(sender.text ?? "")")
        default:
            fatalError("Missing TextField...")
        }
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
    
    
    
}
