//
//  StoryCollectionViewCell.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/14.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var viewImageViewBackground: UIView!
    @IBOutlet weak var viewUserProfileBackground: UIView!
    @IBOutlet weak var imageViewUserProfile: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewImageViewBackground.layer.cornerRadius = 24
        viewUserProfileBackground.layer.cornerRadius = 23.5
        imageViewUserProfile.layer.cornerRadius = 22.5
        
        // 이미지를 원 만큼 짤라주기
        imageViewUserProfile.clipsToBounds = true
        
        // Initialization code
    }

}
