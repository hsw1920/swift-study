import Foundation
import Combine

// PassthroughSubject
// 보내기만함.
let relay = PassthroughSubject<String, Never>()
let subscription1 = relay.sink { value in
    print("subscription1 received value: \(value)")
}
// 데이터가 주입되면 보냄
relay.send("Hello")
relay.send("World")



// CurrentValueSubject
// 초깃값으로 output타입을 넣어주어야하는 특징이 있음.
let variable = CurrentValueSubject<String,Never>("")

variable.send("initial text")

// currentValueSubject는 subscription이 생겼을 때 기존의 데이터를 한 번 보냄.
let subscription2 = variable.sink { value in
    print("subscription2 received value: \(value)")
}
// 데이터가 주입되면 보냄
variable.send("More text")
print(variable.value)

let publisher = ["Here", "we", "go"].publisher
publisher.subscribe(relay)
publisher.subscribe(variable)



