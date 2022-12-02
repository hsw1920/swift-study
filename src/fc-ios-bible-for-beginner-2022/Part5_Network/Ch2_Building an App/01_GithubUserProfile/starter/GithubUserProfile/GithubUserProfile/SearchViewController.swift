//
//  SearchViewController.swift
//  GithubUserSearch
//
//  Created by joonwon lee on 2022/05/25.
//

import UIKit
import Combine
import Kingfisher

class UserProfileViewController: UIViewController {
    
    // setupUI
    // userprofile
    // bind -> updateUI
    // search control -> network
    
    let network = NetworkService(configuration: .default)
    
    @Published private(set) var user: UserProfile?
    var subscriptions = Set<AnyCancellable>()
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        embedSearchControl()
        bind()
    }
    
    private func setupUI() {
        thumbnail.layer.cornerRadius = 80
    }
    
    private func embedSearchControl() {
        self.navigationItem.title = "Search"
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "hsw1920"
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        self.navigationItem.searchController = searchController
    }
    
    private func bind() {
        $user
            .receive(on: RunLoop.main)
            .sink { [unowned self] result in
                self.update(result)
            }.store(in: &subscriptions)
    }
    
    private func update(_ user: UserProfile?) {
        // user가 nil이 들어올 수 있음
        guard let user = user else {
            self.nameLabel.text = "n/a"
            self.loginLabel.text = "n/a"
            self.followerLabel.text = ""
            self.followingLabel.text = ""
            self.thumbnail.image = nil
            return
        }
        
        self.nameLabel.text = user.name
        self.loginLabel.text = user.login
        self.followerLabel.text = "follower: \(user.followers)"
        self.followingLabel.text = "following: \(user.following)"
        // kingfisher 오픈소스 사용하여 간편화
        self.thumbnail.kf.setImage(with: user.avatarUrl)
        
    }
    
}

extension UserProfileViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let keyword = searchController.searchBar.text
        print("search: \(keyword)")
    }
}

extension UserProfileViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("button clicked: \(searchBar.text)")
        
        guard let keyword = searchBar.text, !keyword.isEmpty else { return }
        
        //"https://api.github.com/users/\(keyword)"
        
        // Resource
        
        //        let base = "https://api.github.com/"
        //        let path = "users/\(keyword)"
        //        let params: [String: String] = [:]
        //        let header: [String: String] = ["Content-Type": "application/json"]
        //
        //        var urlComponents = URLComponents(string: base + path)!
        //        let queryItems = params.map { (key: String, value: String) in
        //            return URLQueryItem(name: keyword, value: value)
        //        }
        //        urlComponents.queryItems = queryItems
        //
        //        var request = URLRequest(url: urlComponents.url!)
        //        header.forEach { (key: String, value: String) in
        //            request.addValue(value, forHTTPHeaderField: key)
        //        }
        
        // 위의 만든것을 network를 연결해줘야함
        
        let resource = Resource<UserProfile>(
            base: "https://api.github.com/",
            path: "users/\(keyword)",
            params: [:],
            header: ["Content-Type": "application/json"])
        
        // NetworkService
        network.load(resource)
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion{
                case .failure(let error):
                    self.user = nil
                case .finished: break
                }
            } receiveValue: { user in
                self.user = user
            }.store(in: &subscriptions)

    }
//        URLSession.shared
//            .dataTaskPublisher(for: request)
//            .tryMap { result -> Data in // 오류나 에러를 먼저 잡아야함
//                guard let response = result.response as? HTTPURLResponse,
//                      (200..<300).contains(response.statusCode) else {
//                    let response = result.response as? HTTPURLResponse
//                    let statusCode = response?.statusCode ?? -1
//                    // 잡은 오류를 던져줌
//                    throw NetworkError.responseError(statusCode: statusCode)
//                }
//                // 정상적인 경우 result의 data를 넘겨줌
//                return result.data
//            }
//            .decode(type: UserProfile.self, decoder: JSONDecoder())
//            .receive(on: RunLoop.main)
//            .sink { completion in
//                print("completion: \(completion)")
//                switch completion{
//                case .failure(let error):
//                    self.user = nil
//                case .finished: break
//                }
//            } receiveValue: { user in
//                self.user = user
//            }.store(in: &subscriptions)

        
    //}
}
