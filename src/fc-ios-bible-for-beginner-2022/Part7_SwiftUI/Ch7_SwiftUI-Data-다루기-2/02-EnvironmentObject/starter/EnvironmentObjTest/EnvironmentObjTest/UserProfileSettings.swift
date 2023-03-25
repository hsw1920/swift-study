//
//  UserProfileSettings.swift
//  EnvironmentObjTest
//
//  Created by 홍승완 on 2023/03/25.
//

import Foundation

final class UserProfileSettings: ObservableObject {
    @Published var name: String = ""
    @Published var age: Int = 0
    
    func haveBirthDayParty() {
        age += 1
    }
}
