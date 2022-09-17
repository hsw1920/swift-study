//
//  ProfileViewController.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/15.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    // MARK: - Properties
    @IBOutlet weak var profileCollectionView: UICollectionView!
    
    var userPosts: [GetUserPosts]? {
        didSet { self.profileCollectionView.reloadData() }
    }
    
    var deletedIndex: Int?
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        
        //test code
        //UserFeedDataManager().getUserFeed(self)
        setupData()
    }
    
    // MARK: - Actions
    @objc
    func didLongPressCell(gestureRecognizer: UILongPressGestureRecognizer){
        // 방어코드
        if gestureRecognizer.state != .began { return }
        
        // 제스쳐가 나타난 위치를 파악함
        let position = gestureRecognizer.location(in: profileCollectionView)
        
        if let indexPath = profileCollectionView.indexPathForItem(at: position) {
            print("DEBUG: ",indexPath.item)
            
            guard let userPosts = self.userPosts else { return }
            let cellData = userPosts[indexPath.item]
            self.deletedIndex = indexPath.item
            if let postIdx = cellData.postIdx {
                // 삭제 API를 호출
                UserFeedDataManager().deleteUserFeed(self, postIdx)
            }
        }
    }
    
    // MARK: - Helpers
    private func setupCollectionView() {
        // delegate 연결
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = self
        
        // cell 등록
        profileCollectionView.register(
            UINib(
                nibName: "ProfileCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "ProfileCollectionViewCell")
        profileCollectionView.register(
            UINib(
                nibName: "PostCollectionViewCell",
                bundle: nil),
            forCellWithReuseIdentifier: "PostCollectionViewCell")
        
        let gesture = UILongPressGestureRecognizer(
            target: self,
            action: #selector(didLongPressCell(gestureRecognizer:))
            )
        gesture.minimumPressDuration = 0.66
        gesture.delegate = self
        gesture.delaysTouchesBegan = true
        profileCollectionView.addGestureRecognizer(gesture)
    }
    
    private func setupData() {
        UserFeedDataManager().getUserFeed(self)
        // 성공했을 때 실행할 메소드 만들어 줘야함 -> extension
    }
    
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // section의 갯수
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    // cell의 갯수
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        default:
            //return 24
            return userPosts?.count ?? 0
        }
    }
    
    // cell 생성
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = indexPath.section
        switch section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCollectionViewCell", for: indexPath) as? ProfileCollectionViewCell else {
                return UICollectionViewCell()
                //또는 fatalError("셀 타입캐스팅 실패...")
            }
            return cell
        default:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCollectionViewCell", for: indexPath) as?
                    PostCollectionViewCell else {
                return UICollectionViewCell()
                //또는 fatalError("셀 타입캐스팅 실패...")
            }
            
            let itemIndex = indexPath.item
            
            if let cellData = self.userPosts {
                cell.setupData(cellData[itemIndex].postImgUrl) // <-- 데이터 전달
            }
            return cell
        }
    }
}

// 사이즈 조절을 위해 UICollectionViewDelegateFlowLayout
// 사이즈 조절을 하려면 반드시 선언해주어야함 + 컬렉션뷰 속성의 estimateSize = None
extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let section = indexPath.section
        switch section {
        case 0:
            return CGSize(
                width: collectionView.frame.width,
                height: 159)
        default:
            let side = CGFloat((collectionView.frame.width/3) - (4/3))
            return CGSize(
                width: side,
                height: side)
        }
    }
    
    // section안의 item간(열간) 간격!
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
    
    // line간(행간) 간격
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch section {
        case 0:
            return CGFloat(0)
        default:
            return CGFloat(1)
        }
    }
}

// MARK: - API 통신 메소드

extension ProfileViewController {
    func successFeedAPI(_ result: UserFeedModel) {
        self.userPosts = result.result.getUserPosts
    }
    
    func successDeletePostAPI(_ isSuccess: Bool) {
        guard isSuccess else { return }
        if let deletedIndex = self.deletedIndex {
            self.userPosts?.remove(at: deletedIndex)
        }
    }
}
