//
//  TodayBenefitCell.swift
//  TossBenefitTab
//
//  Created by 홍승완 on 2023/04/02.
//

import UIKit

class TodayBenefitCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ctaButton: UIButton!
    
    // 앱에서 깨어나는 시점 초기에 실행되는 함수
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.systemGray.withAlphaComponent(0.3)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        
        self.ctaButton.layer.masksToBounds = true
        self.ctaButton.layer.cornerRadius = 5
    }
    
    func configure(item: Benefit) {
        titleLabel.text = item.title
        ctaButton.setTitle(item.ctaTitle, for: .normal)
    }
}
