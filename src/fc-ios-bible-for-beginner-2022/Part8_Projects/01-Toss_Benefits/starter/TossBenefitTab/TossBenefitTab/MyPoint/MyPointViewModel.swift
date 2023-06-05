//
//  MyPointViewModel.swift
//  TossBenefitTab
//
//  Created by 홍승완 on 2023/06/05.
//

import Foundation
import Combine

final class MyPointViewModel {
    @Published var point: MyPoint
    
    init(point: MyPoint) {
        self.point = point
    }
}
