//
//  FeedDataManager.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/16.
//

import Alamofire

class FeedDataManager {
    func feedDataManager(_ parameters: FeedAPIInput, _ viewController: HomeViewController) {
        AF.request("https://api.thecatapi.com/v1/images/search", method: .get, parameters: parameters).validate().responseDecodable(of: [FeedModel].self) { response in
            switch response.result {
            case .success(let result):
                print("성공")
                viewController.successAPI(result)
            case .failure(let error):
                print(error.localizedDescription)
                print("실패")
            }
        }
    }
}
