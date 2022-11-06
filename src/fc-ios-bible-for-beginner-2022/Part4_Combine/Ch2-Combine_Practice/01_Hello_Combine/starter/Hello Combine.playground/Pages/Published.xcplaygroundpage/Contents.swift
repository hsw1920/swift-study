//: [Previous](@previous)

import Foundation
import UIKit
import Combine

final class SomeViewModel {
    @Published var name: String = "Jack"
    var age: Int = 20
}

final class Label {
    var text: String = ""
}

let label = Label()
let vm = SomeViewModel()
print("text: \(label.text)")

// '$'표시 쓰면 publisher이며, subscribe 할 수 있음.
// name은 publisher이고 label의 text에 할당함
vm.$name.assign(to: \.text, on: label)
print("text: \(label.text)")

vm.name = "Jason"
print("text: \(label.text)")

vm.name = "Hoo"
print("text: \(label.text)")

// 위처럼 한 번 assign으로 구독해놓으면 vm.name이 업데이트될때마다 label.text는 자동으로 변경됨
// UILabel() -> ("여기서의 label") 이 subscribe 해놓은 data(vm.$name)를 따라서 자동으로 업데이트되는 형식으로 개발에 사용할 수 있음
// vm.name이 바뀔 때마다 label.text = vm.name 의 코드 1줄을 계속써주어야하지만 구독함으로써 그럴 필요가 없어짐
//: [Next](@next)
