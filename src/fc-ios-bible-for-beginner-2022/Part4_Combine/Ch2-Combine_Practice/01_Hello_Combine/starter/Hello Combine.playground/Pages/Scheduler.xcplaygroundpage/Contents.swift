//: [Previous](@previous)

import Foundation
import Combine

let arrayPublisher = [1,2,3].publisher

let queue = DispatchQueue(label: "custom")

let subscription = arrayPublisher
    .subscribe(on: queue)
    // 헤비한 작업들을 메인스레드가 아닌곳에서 진행하고
    .map{value -> Int in
        print("transform: \(value), thread: \(Thread.current)")
        return value
    }
    // 위의 작업들을 마친 후 UI작업들을 main스레드에서 처리해줌
    .receive(on: DispatchQueue.main)
    .sink { value in
        print("Received Value: \(value), thread: \(Thread.current)")
    }
    
    



//: [Next](@next)
