//
//  DeleteUserFeed.swift
//  Catstagram
//
//  Created by νμΉμ on 2022/09/17.
//

import Foundation


struct DeleteUserFeed: Decodable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: String?
}
