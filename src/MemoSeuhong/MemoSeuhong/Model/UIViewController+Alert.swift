//
//  UIViewController+Alert.swift
//  MemoSeuhong
//
//  Created by 홍승완 on 2022/09/02.
//

import UIKit

extension UIViewController {
    func alert(title: String = "알림", message: String){
        
        // preferredStyle에는 alertView와 ActionSheet 가 있음
        // -> alertView 사용
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // alertView의 버튼은 "UIAlertAction"으로 생성할 수 있음
        // style 기본-> .default
        // handler -> btn을 탭했을 때 전달할 코드 (여기서는 없으므로 nil)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        
        // btn 생성했으니 alertView에 추가함
        alert.addAction(okAction)
        
        // present 메소드를 활용하여 경고창(alertView)를 화면에 표시함
        present(alert, animated: true, completion: nil)
    }
}


