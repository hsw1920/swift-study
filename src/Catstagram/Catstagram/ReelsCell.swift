//
//  ReelsCell.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/18.
//

import UIKit
import SnapKit
import AVKit

class ReelsCell: UICollectionViewCell {
    static let identifier = "ReelsCell"
    
    var videoView: VideoPlayerView?
    
    // 기능구현은 안할꺼라 강의에서는 ImageVIew로 선언했음. 기능구현 할꺼면 UIButton으로 구현해야함
    // 릴스
    let cellTitleLabel = UILabel()
    
    // 카메라
    let cameraImageView = UIImageView()
    
    // 댓글
    let commentImageView = UIImageView()
    
    // 좋아요
    let likeImageView = UIImageView()
    
    // 공유하기
    let shareImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupAttribute() {
        cellTitleLabel.text = "릴스"
        cellTitleLabel.font = .boldSystemFont(ofSize: 25)
        cellTitleLabel.textAlignment = .left
        
        [cameraImageView,shareImageView,likeImageView,commentImageView].forEach {
            $0.contentMode = .scaleAspectFit
            $0.tintColor = .white
        }
        cameraImageView.image = UIImage(systemName: "camera")
        shareImageView.image = UIImage(systemName: "paperplane")
        likeImageView.image = UIImage(systemName: "suit.heart")
        commentImageView.image = UIImage(systemName: "message")
        
    }
    
    //private 쓰면 VC에서 setupURL 사용 못하는데 강의에서는 어케한건지 모르겠다
    // -> public이었는데 private로 잘못 봤음...
    public func setupURL(_ urlStr: String){
        // 만들어둔 videoPlayer를 전달함
        self.videoView = VideoPlayerView(frame: .zero, urlStr: urlStr)
        setupAttribute()
        setupLayout()
    }
    
    // code로 빌드를 하면 속도가 월등히 빠름.
    // + 코드 수정이 쉽고, 다른 프로젝트에서의 재사용성이 뛰어남
    
    private func setupLayout(){
        guard let videoView = videoView else { return }
        // contentView에 만들어 둔 videoView를 추가함
        contentView.addSubview(videoView)
        
        // clouser를 사용함. (addedContstraints와 같음). make == videoView
        videoView.snp.makeConstraints { make in
            // 원래는 앵커 등을 사용하여 layout 잡는 코드가 5줄 이상으로 길지만
            // snapkit을 사용하면 아래와 같이 1줄로 사용할 수 있는 장점이 있음.
            make.edges.equalToSuperview() // = 상하좌우 모든 값에 대해 superView에 맞춘다
        }
        [cellTitleLabel, cameraImageView,
         likeImageView,
        commentImageView,
        shareImageView]
            .forEach { contentView.addSubview($0)}
        
        cellTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20) // offset은 얼마만큼 떨어져있는가?
            make.leading.equalToSuperview().offset(20)
        }
        
        cameraImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(35)
        }
        
        shareImageView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-50)
            make.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(35)
        }
        
        let space = CGFloat(20)
        
        commentImageView.snp.makeConstraints { make in
            make.bottom.equalTo(shareImageView.snp.top).offset(-space) // 공유하기버튼과 bottom을 맞추고 오프셋은 10
            make.centerX.equalTo(shareImageView)
            make.width.height.equalTo(35)
        }
        
        likeImageView.snp.makeConstraints { make in
            make.bottom.equalTo(commentImageView.snp.top).offset(-space) // 공유하기버튼과 bottom을 맞추고 오프셋은 10
            make.centerX.equalTo(shareImageView)
            make.width.height.equalTo(35)
        }
    }
}
