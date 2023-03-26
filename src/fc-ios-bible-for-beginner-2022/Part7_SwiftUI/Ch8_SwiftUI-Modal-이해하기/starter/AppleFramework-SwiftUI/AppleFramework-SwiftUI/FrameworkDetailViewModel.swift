//
//  FrameworkDetailViewModel.swift
//  AppleFramework-SwiftUI
//
//  Created by 홍승완 on 2023/03/26.
//

import Foundation
import SwiftUI
final class FrameworkDetailViewModel: ObservableObject {
    @Published var framework: AppleFramework
    @Published var isSafaroPresented: Bool = false
    init(framework: AppleFramework) {
        self.framework = framework
    }
}

