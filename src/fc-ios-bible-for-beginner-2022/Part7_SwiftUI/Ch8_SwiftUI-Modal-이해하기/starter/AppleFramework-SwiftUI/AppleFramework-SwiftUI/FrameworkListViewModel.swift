//
//  FrameworkListViewModel.swift
//  AppleFramework-SwiftUI
//
//  Created by 홍승완 on 2023/03/26.
//

import Foundation

final class FrameworkListViewModel: ObservableObject {
    @Published var models: [AppleFramework] = AppleFramework.list
    @Published var isShowingDetail: Bool = false {
        didSet {
            print("--> isShowingDetail: \(isShowingDetail)")
        }
    }
    @Published var selectedItem: AppleFramework?
}
