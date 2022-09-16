//
//  PostCollectionViewCell.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/15.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    // 외부에서 접근해야하니 public
    public func setupData() {
        // 이미지뷰의 이미지를 업로드한다.
    }
}
