//
//  FeedUploadModel.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/16.
//

struct FeeduploadModel: Decodable {
    var isSuccess: Bool
    var code: Int
    var message: String
    var result: FeedUploadResult?
}

struct FeedUploadResult: Decodable {
    var postIdx: Int?
}
