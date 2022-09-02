//
//  Model.swift
//  MemoSeuhong
//
//  Created by 홍승완 on 2022/09/02.
//

import Foundation

// 메모목록 구현
// db에 저장하는 부분은 나중에
class Memo {
    var content: String
    var insertDate: Date
    
    init(content: String){
        self.content = content
        // 현재 날짜를 바로 저장하므로 별도의 파라미터가 필요없음
        insertDate = Date()
    }
    
    // Dummy Data
    static var dummyMemoList = [
        Memo(content: "Lorem Ipsum"),
        Memo(content: "Swift tutorial"),
        Memo(content: "GitHub save"),
    ]
}
