//: [Previous](@previous)

import Foundation
import Combine
import UIKit



// URLSessionTask Publisher and JSON Decoding Operator

struct SomeDecodable: Decodable { }

URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.google.com")!)
    .map { data, response in
    return data
    }
    .decode(type: SomeDecodable.self, decoder: JSONDecoder())
    

// Notifications
// data를 전송하는데에 있어서 notificationcenter를 이용하여 noti를 보내기도하였음
let center = NotificationCenter.default
let noti = Notification.Name("MyNoti")
let notiPublisher = center.publisher(for: noti, object: nil) // center를 publisher로 만들고

// noti를 받으면 print를 하도록 코드를 작성함
let subscription1 = notiPublisher.sink { _ in
    print("Noti Received")
}

center.post(name: noti, object: nil)
subscription1.cancel() // 구독자가 구독해제함

// KeyPath binding to NSObject instances

let ageLabel = UILabel()
print("text: \(ageLabel.text)")

Just(28)
    .map {"Age is \($0)"}
    .assign(to: \.text, on: ageLabel)
print("text: \(ageLabel.text)")


// Timer
// autoconnect 를 이용하면 subscribe 되면 바로 시작함
let timerPublisher = Timer
    .publish(every: 1, on: .main, in: .common) // 1초마다 main 스레드에서, common방식으로
    .autoconnect() // autoconnect()를 쓰면 어떤 subscriber가 구독했을 때 알아서 timer가 동작하도록 함

let subscription2 = timerPublisher.sink { time in
    print("time: \(time)")
}
DispatchQueue.main.asyncAfter(deadline: .now()+5) {
    print("TimeOut")
    subscription2.cancel()
}

//: [Next](@next)
