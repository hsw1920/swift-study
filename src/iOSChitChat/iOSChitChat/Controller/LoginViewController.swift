//
//  ViewController.swift
//  iOSChitChat
//
//  Created by 홍승완 on 2022/12/20.
//

import UIKit
import SnapKit
/*
 - Login Screen
 - Channel List / Chats
 - Message
 - Create Chats/ Channels
 - Settings (logout)
 */

final class LoginViewController: UIViewController {
    
    private let usernameField: UITextField = {
        let field = UITextField()
        field.placeholder = "Username..."
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        //field.translatesAutoresizingMaskIntoConstraints = false
        field.backgroundColor = .secondarySystemBackground
        return field
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
//        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CONTINUE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iOS ChitChat"
        view.backgroundColor = .systemBackground
        view.addSubview(usernameField)
        view.addSubview(button)
        addConstraints()
        button.addTarget(self, action: #selector(didTapContinue), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        usernameField.becomeFirstResponder()
        
        if ChatManager.shared.isSignedIn {
            presentChatList(animated: false)
        }
    }
    
    private func addConstraints() {
        usernameField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
        button.snp.makeConstraints { make in
            make.top.equalTo(usernameField.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-50)
            make.height.equalTo(50)
        }
    }
    
    @objc private func didTapContinue() {
        usernameField.resignFirstResponder()
        guard let text = usernameField.text, !text.isEmpty else {
            return
        }
        
        ChatManager.shared.signIn(with: text) {[weak self] success in
            guard success else {
                return
            }
            print("Did login")
            
            // Take user to chat list
            DispatchQueue.main.async {
                self?.presentChatList()
            }
        }
    }
    
    func presentChatList(animated: Bool = true) {
        print("Should show chat list")
        guard let vc = ChatManager.shared.createChannelList() else { return }
        
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose,
                                                               target: self,
                                                               action: #selector(didTapCompose)
        )
        
        let tabVC = TabBarViewController(chatList: vc)
        tabVC.modalPresentationStyle = .fullScreen
        
        present(tabVC, animated: animated)
    }
    
    @objc private func didTapCompose() {
        let alert = UIAlertController(title: "New Chat",
                                      message: "Enter channel name",
                                      preferredStyle: .alert
        )
        alert.addTextField()
        alert.addAction(.init(title: "Cancel", style: .cancel))
        alert.addAction(.init(title: "Create", style: .default, handler: { _ in
            guard let text = alert.textFields?.first?.text, !text.isEmpty else {
                return
            }
            DispatchQueue.main.async {
                ChatManager.shared.createNewChannel(name: text)
            }

        }))
        
        presentedViewController?.present(alert, animated: true)
    }
    
}

