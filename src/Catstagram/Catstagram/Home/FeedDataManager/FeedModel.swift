//
//  FeedModel.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/16.
//

// Encoding이후에 Decoding-> Decodable이 필요함
// 받아줄 준비
struct FeedModel : Decodable {
    var id: String?
    var url: String?
}
