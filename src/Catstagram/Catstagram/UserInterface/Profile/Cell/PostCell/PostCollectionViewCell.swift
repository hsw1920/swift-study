//
//  PostCollectionViewCell.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/15.
//

import UIKit
import Kingfisher

class PostCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    // 외부에서 접근해야하니 public
    public func setupData(_ imageURLStr: String?) {
        // 이미지뷰의 이미지를 업로드한다.
        
        // 옵셔널 해제하고
        guard let imageURLStr = imageURLStr else { return }
        // url 만들면서 타입변환이 잘 되면 postImageView에 이미지가 정상적으로 업로드 됨
        if let url = URL(string: imageURLStr){
            postImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "photo"))
        }
        
    }
}
