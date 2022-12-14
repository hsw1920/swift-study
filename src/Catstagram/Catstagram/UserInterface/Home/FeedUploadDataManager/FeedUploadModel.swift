//
//  FeedUploadModel.swift
//  Catstagram
//
//  Created by νμΉμ on 2022/09/16.
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
