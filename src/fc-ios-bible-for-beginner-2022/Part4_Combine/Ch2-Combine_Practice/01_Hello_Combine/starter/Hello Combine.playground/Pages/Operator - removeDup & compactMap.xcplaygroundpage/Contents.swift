//: [Previous](@previous)

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

// removeDuplicates
// 중복된것 제거
let words = "hey hey there! Mr Mr ?"
    .components(separatedBy: " ")
    .publisher

words
    .removeDuplicates()
    .sink { value in
        print(value)
    }.store(in: &subscriptions) // -> subscriptions에 저장함


let subscription = words // -> subscriptions에 저장함 위와동일
    .removeDuplicates()
    .sink { value in
        print(value)
    }

// compactMap
// nil을 제외

let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher

strings
    .compactMap{Float($0)}
    .sink { value in
        print(value)
    }.store(in: &subscriptions)

// ignoreOutput
// 새로운것 무시
let numbers = (1...10_000).publisher
numbers
    .ignoreOutput()
    .sink(receiveCompletion: { print("Completed with: \($0)") },
          receiveValue: { print($0) })
    .store(in: &subscriptions)


// prefix
// 들어올 데이터의 앞의 일부분만 받겠다
let tens = (1...10).publisher

tens
    .prefix(5)
    .sink(receiveCompletion: {print("Completed with: \($0)")},
          receiveValue: {print($0)})
    .store(in: &subscriptions)
//: [Next](@next)
