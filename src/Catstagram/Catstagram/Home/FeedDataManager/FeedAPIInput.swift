//
//  FeedAPIInput.swift
//  Catstagram
//
//  Created by 홍승완 on 2022/09/16.
//

// Encodable : 데이터를 보낼때 바꿔서 보내줌.
// 넣어줄 준비
struct FeedAPIInput : Encodable {
    var limit: Int?
    var page: Int?
    
}
