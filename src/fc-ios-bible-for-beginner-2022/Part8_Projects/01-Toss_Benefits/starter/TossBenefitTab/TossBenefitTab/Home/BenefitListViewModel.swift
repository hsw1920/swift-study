//
//  BenefitListViewModel.swift
//  TossBenefitTab
//
//  Created by 홍승완 on 2023/06/05.
//

import Foundation
import Combine

final class BenefitListViewModel {
    
    // data가 세팅이 되면 바인딩된곳이 돌아감
    @Published var todaySectionItems: [AnyHashable] = []
    @Published var otherSectionItems: [AnyHashable] = []
    
    let benefitDidTapped = PassthroughSubject<Benefit, Never>()
    let pointDidTapped = PassthroughSubject<MyPoint, Never>()
    
    func fetchItems() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.todaySectionItems = TodaySectionItem(point: .default, today: .today).sectionItems
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            self.otherSectionItems = Benefit.others
        }
    }
}
