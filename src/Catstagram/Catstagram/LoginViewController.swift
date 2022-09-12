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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    @IBAction func emailTextFieldEditingChanged(_ sender: UITextField) {
        // 옵셔널
        // 값이 있을수도 없을수도 있음
        let text = sender.text ?? ""
        self.email = text
    }
    
    @IBAction func passwordTextFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        self.password = text
    }
    
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        
    }
    
    @IBAction func registerDidTap(_ sender: UIButton) {
    }
}
