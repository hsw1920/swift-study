//
//  MyPoint.swift
//  TossBenefitTab
//
//  Created by 홍승완 on 2023/04/02.
//

import Foundation

struct MyPoint: Hashable {
    var point: Int
}

extension MyPoint {
    static let `default` = MyPoint(point: 0) // MyPoint.default 로 예약어 사용가능
}
