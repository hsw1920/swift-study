//
//  PhotosViewController.swift
//  PhotosSeuhong
//
//  Created by 홍승완 on 2022/09/06.
//

import UIKit

class PhotosViewController: UIViewController {

    var fav: Bool = false
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let list = Model.list
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    @IBAction func tabbedCell(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ShowImageViewController")
        vc?.fir
        present(vc!, animated: true)
        
    }
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = width
        let paddig = CGFloat(1)
        let cellWidth = (width - paddig*2)/3
        let cellHeight = (height - paddig*2)/3
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        cell.configure(list[indexPath.row])
        
        if list[indexPath.row].favorite == false {
            cell.favorite.isHidden = true
        }
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    
}
