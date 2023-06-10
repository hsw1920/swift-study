//
//  DetailViewModel.swift
//  CarrotHomeTab
//
//  Created by 홍승완 on 2023/06/10.
//

import Foundation


final class DetailViewModel {
    
    let network: NetworkService
    let itemInfo: ItemInfo
    
    @Published var itemInfoDetails: ItemInfoDetails? = nil
    
    init(network: NetworkService, itemInfo: ItemInfo) {
        self.network = network
        self.itemInfo = itemInfo
    }
    
    func fetch() {
        
        // simulate network like behavior
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.3) { [unowned self] in
            self.itemInfoDetails = ItemInfoDetails(user: User.mock, item: self.itemInfo, details: ItemExtraInfo.mock)
        }
        
//        let resource: Resource<ItemInfoDetails> = Resource(
//            base: <#T##String#>,
//            path: <#T##String#>,
//            params: [:],
//            header: [:]
//        )
//
//        network.load(resource)
//            .receive(on: RunLoop.main)
    }
}
