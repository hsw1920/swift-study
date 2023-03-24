//
//  StockRankViewModel.swift
//  StockRank-SwiftUI
//
//  Created by 홍승완 on 2023/03/24.
//

import Foundation

final class StockRankViewModel: ObservableObject {
    @Published var models: [StockModel] = StockModel.list
    
    var numOfFavorites: Int {
        let favotitesStocks = models.filter { $0.isFavorite }
        return favotitesStocks.count
    }
}
