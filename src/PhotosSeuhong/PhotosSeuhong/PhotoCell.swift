//
//  PhotoCell.swift
//  PhotosSeuhong
//
//  Created by νμΉμ on 2022/09/06.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var favorite: UIImageView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(_ item: Model){
        thumbnailImage.image = item.thumbnailImage
        thumbnailImage.contentMode = .scaleAspectFill
        if item.favorite == false {
            
        } else {
            favorite.image = UIImage(systemName: "heart.fill")
        }
    }
    
}


