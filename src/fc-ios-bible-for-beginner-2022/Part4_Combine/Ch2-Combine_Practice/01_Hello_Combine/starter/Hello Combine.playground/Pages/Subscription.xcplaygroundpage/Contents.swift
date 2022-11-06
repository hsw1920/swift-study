//: [Previous](@previous)

import Foundation
import Combine


let subject = PassthroughSubject<String, Never>() // publisher의 아웃풋타입과 failure(Never)를 정해줌

// The print() operator prints you all lifecycle events
// subscription이 subject라는 publisher에게 sink됨(빠지게됨, 구독됨)
let subscription = subject
    .print("[Debug]")
    .sink { value in
    print("Subscriber received value: \(value)")
}

subject.send("Hellow")
subject.send("Hello again!")
subject.send("Hello for the last time!")

//subject.send(completion: .finished) // publisher가 직접 관계를 끊도록 함
subscription.cancel() // 구독자 스스로도 관계를 끊을 수 있음

subject.send("Hello ?? :(") // .finished 되었기 때문에 더 못 보냄  // or // subscription이 cancel()했기 떄문에 더 못 보냄
//: [Next](@next)
