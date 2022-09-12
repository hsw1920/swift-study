//
//  UIView+Extenstion.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/12.
//

import UIKit

extension UIView {
    // 이를 inpecter로 추가함. (확장함)
    @IBInspectable var cornerRadius: CGFloat { // 모서리따기 기능
        // 값을 읽어올 때
        get {
            return layer.cornerRadius // 레이어에 얼마만큼 둥글게 할지 값을 가져옴
        }
        // 값을 세팅할 때
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
