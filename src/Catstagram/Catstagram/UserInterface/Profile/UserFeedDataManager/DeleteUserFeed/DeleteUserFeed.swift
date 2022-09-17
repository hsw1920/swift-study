//
//  DeleteUserFeed.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/17.
//

import Foundation


struct DeleteUserFeed: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: String?
}
