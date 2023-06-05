//
//  ButtonBenefitViewModel.swift
//  TossBenefitTab
//
//  Created by 홍승완 on 2023/06/05.
//

import Foundation

final class ButtonBenefitViewModel {
    @Published var benefit: Benefit
    @Published var benefitDetails: BenefitDetails?
    
    init(benefit: Benefit) {
        self.benefit = benefit
    }
    
    func fetchDetails() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.benefitDetails = .default
            print(self.benefitDetails)
        }
    }
}
