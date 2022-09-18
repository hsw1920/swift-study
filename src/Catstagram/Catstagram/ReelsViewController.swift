//
//  RealsViewController.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/18.
//

import UIKit
import SnapKit

class ReelsViewController: UIViewController {
    
// MARK: - Properties
    @IBOutlet weak var collectionView: UICollectionView!
    private var nowPage = 0
    
    private let videoURLStrArr = ["dummyVideo1","dummyVideo2"]
    
// MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

// MARK: - Action
    
    
// MARK: - Helpers
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 스크롤이 빨리되도록 처리하는 코드
        collectionView.decelerationRate = .fast
        
        collectionView.register(
            ReelsCell.self,
            forCellWithReuseIdentifier: ReelsCell.identifier
        )
        
        startLoop()
    }
    
    private func startLoop(){
        // 2초마다 반복
        let _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
            // 아래에서 custom한 메소드 사용
            self.moveNextPage()
        }
    }
    
    private func moveNextPage() {
        // 0 번째 섹션에 있는 item의 갯수 반환
        let itemCount = collectionView.numberOfItems(inSection: 0)
        
        nowPage += 1 // 다음페이지
        
        // 마지막 페이지인경우 처음으로
        if nowPage >= itemCount {
            nowPage = 0
        }
        collectionView.scrollToItem(
            at: IndexPath(item: nowPage, section: 0), // nowPage로 이동하고 section은 0
            at: .centeredVertically, // 수직으로 이동
            animated: true // 애니메이션 사용함
        )
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ReelsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: ReelsCell.identifier,
            for: indexPath) as? ReelsCell
        else {
            return UICollectionViewCell()
        }
        // 만들어둔 RellsCell을 적용함
        cell.setupURL(videoURLStrArr.randomElement()!)
        return cell
    }
    
    // 비디오를 보여주는것이 끝났을 때 실행되는 메소드 : didEndDisplaying
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // 임의의 ReelsCell에 접근하여 성공했다면?
        if let cell = collectionView.cellForItem(at: indexPath) as? ReelsCell {
            // 만들어뒀던 메모리관리 메소드인 cleanup()을 실행함
            // cleanup() -> 큐플레이어를 제거함 -> 메모리관리
            cell.videoView?.cleanup()
        }
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension ReelsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}
