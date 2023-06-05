//
//  BenefitCell.swift
//  TossBenefitTab
//
//  Created by 홍승완 on 2023/04/02.
//

import UIKit

class BenefitCell: UICollectionViewCell {
    
    @IBOutlet weak var benefitImage: UIImageView!
    @IBOutlet weak var desciptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(item: Benefit) {
        benefitImage.image = UIImage(named: item.imageName)
        desciptionLabel.text = item.description
        titleLabel.text = item.title
    }
}
