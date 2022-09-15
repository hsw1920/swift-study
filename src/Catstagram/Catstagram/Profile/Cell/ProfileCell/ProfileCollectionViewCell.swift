//
//  ProfileCollectionViewCell.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/15.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProfileCollectionViewCell"
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var addProfileImageView: UIImageView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var addFriendButton: UIButton!
    
    @IBOutlet weak var postingCountLabel: UILabel!
    @IBOutlet weak var follwerCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupAttribute()
    }
    
    private func setupAttribute(){
        profileImageView.layer.cornerRadius = 44
        addProfileImageView.layer.cornerRadius = 12
        
        profileImageView.layer.borderWidth = 1
        profileImageView.layer.borderColor = UIColor.darkGray.cgColor
        
        editButton.layer.cornerRadius = 5
        editButton.layer.borderColor = UIColor.lightGray.cgColor
        editButton.layer.borderWidth = 1
        
        addFriendButton.layer.cornerRadius = 3
        addFriendButton.layer.borderWidth = 1
        addFriendButton.layer.borderColor = UIColor.lightGray.cgColor
        
        [postingCountLabel, follwerCountLabel, followingCountLabel]
            .forEach { $0?.text = "\(Int.random(in: 10...200))"}
    }
}
