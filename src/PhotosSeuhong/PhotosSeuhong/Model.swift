//
//  Model.swift
//  PhotosSeuhong
//
//  Created by 홍승완 on 2022/09/06.
//

import Foundation
import UIKit

class Model{
    let thumbnailImage: UIImage!
    
    init(_ name: String) {
        self.thumbnailImage = UIImage(named: name)
    }
    static let list: [Model] = (1...40).map { item in
        return Model(String(item))
    }
}

//[
//    Model("1"),
//    Model("2"),
//    Model("3"),
//    Model("4"),
//    Model("5"),
//    Model("6"),
//    Model("7"),
//    Model("8"),
//    Model("9"),
//    Model("10"),
//]
