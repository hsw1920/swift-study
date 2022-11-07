//: [Previous](@previous)

import Foundation
import Combine


// Basic CombineLatest

let strPublisher = PassthroughSubject<String,Never>()
let numPublisher = PassthroughSubject<Int,Never>()

Publishers.CombineLatest(strPublisher, numPublisher).sink { (str, num) in
    print("Receive: \(str), \(num)")
}
//strPublisher.combineLatest(numPublisher).sink { (str, num) in
//    print("Receive: \(str), \(num)")
//}

//strPublisher.send("a")
//strPublisher.send("b")
//strPublisher.send("c")
//
//numPublisher.send(1)
//numPublisher.send(2)
//numPublisher.send(3)

strPublisher.send("a")
numPublisher.send(1)
strPublisher.send("b")
strPublisher.send("c")

numPublisher.send(2)
numPublisher.send(3)


// Advanced CombineLatest

let usernamePublisher = PassthroughSubject<String,Never>()
let passwordPublisher = PassthroughSubject<String,Never>()

//Publishers.Merge(usernamePublisher, passwordPublisher)
//    .map { (username, password) -> Bool in
//        return !username.isEmpty && !password.isEmpty && password.count>12
//    }
//    .sink { valid in
//        print("Credential valid? : \(valid)")
//    }

let validatedCredetialsSubscription = usernamePublisher.combineLatest(passwordPublisher)
    .map { (username, password) -> Bool in
        return !username.isEmpty && !password.isEmpty && password.count>12
    }
    .sink { valid in
        print("Credential valid? : \(valid)")
    }

usernamePublisher.send("jasonlee")
passwordPublisher.send("weakpw")
passwordPublisher.send("verystrongpassword")


// Merge

let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = [300, 400, 500].publisher
//let publisher2 = ["300", "400", "500"].publisher

let mergedPublisherSubscription = publisher1.merge(with: publisher2)
    .sink { value in
        print("Merge: subscription received value: \(value)")
    }


//: [Next](@next)
