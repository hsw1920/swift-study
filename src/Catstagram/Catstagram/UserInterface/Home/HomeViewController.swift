//
//  HomeViewController.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/13.
//

import UIKit
import Kingfisher

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrayCat: [FeedModel] = []
    
    let imagePickerViewController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        // table cell간 나눔줄을 없앰
        tableView.separatorStyle = .none
        // cell이 보이기위해 nib을 사용해야함
        let feedNib = UINib(nibName: "FeedTableViewCell", bundle: nil)
        tableView.register(feedNib, forCellReuseIdentifier: "FeedTableViewCell")
        let storyNib = UINib(nibName: "StoryTableViewCell", bundle: nil)
        tableView.register(storyNib, forCellReuseIdentifier: "StoryTableViewCell")
        
        // API 연동
        let input = FeedAPIInput(limit: 30, page: 10)
        // data가 연동되는 VC가 self(HomeViewController 자신)이란걸 알려줌
        FeedDataManager().feedDataManager(input, self)
        
        // delegate 추가
        imagePickerViewController.delegate = self
    }
    
    // present를 통해 앨범을 띄워주어야함.
    @IBAction func buttonGoAlbum(_ sender: Any) {
        // 카메라인지(.camera) 앨범(.photoLibrary) 인지 선택함
        self.imagePickerViewController.sourceType = .photoLibrary
        // present를 통해 해당 뷰로 이동함
        self.present(imagePickerViewController, animated: true, completion: nil)
    }
    
}


// MARK: - extension


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 배열 크기에 맞게 세팅
        return arrayCat.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 첫번째일경우 Story
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "StoryTableViewCell", for: indexPath) as? StoryTableViewCell else {
                return UITableViewCell()
            }
            return cell
        } else { // 그 다음부터는 Feed
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as? FeedTableViewCell else {
                return UITableViewCell()
            }
            //cell.selectionStyle = .none
            if let urlString = arrayCat[indexPath.row-1].url {
                let url = URL(string: urlString)
                cell.imageViewFeed.kf.setImage(with: url)
            }
            
            // 서버에게 이미지 파일 자체를 보내는 경우에는
            // upload를 이용하여 multipart 형태로 보내게됨
            // 본 강의에서는 url을 string 형태로 전달함
                
            return cell
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 80
        } else {
            return 600
        }
    }
    
    // cell이 보여질 때, collectionView를 설정해 줄 것임
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? StoryTableViewCell else {
            return
        }
        tableViewCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // 몇 개의 cell?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    // 어떤 cell?
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCollectionViewCell", for: indexPath) as? StoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 60)
    }
    
}

extension HomeViewController {
    func successAPI(_ result: [FeedModel]) {
        arrayCat = result
        tableView.reloadData()
    }
}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // 어떤 이미지를 pick을 하는것이 끝났을 때 발생하는 메소드
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // 1. data를 firebase로 저장소 url을 연결하거나
        // 2. multiparameter를 통해 파일 src자체를 주거나
        
        //여기서는 1번방법
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let imageString = "gs://catstargram-d7fbf.appspot.com/Cat"
            let input = FeeduploadInput(content: "저희 상이입니다. 귀엽지 않나요?", postImgsUrl: [imageString])
            FeedUploadDataManager().posts(self, input)
            
            self.dismiss(animated: true, completion: nil)
        }
    }
}
