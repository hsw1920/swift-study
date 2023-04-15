//
//  MyBinding.swift
//  TodaysSwiftUI
//
//  Created by 홍승완 on 2023/04/16.
//

import SwiftUI

struct MyBinding: View {
    // State는 항상 해당 값으로 초기화됨
    @State var isTurnedOn: Bool = false
    // State 변수의 상태를 계속 "붙잡아"주고있는 녀석이 바로 Binding 변수
    @State var myText: String = ""
    
    var body: some View {
        VStack{
            Toggle(isOn: $isTurnedOn) {
                Text("스위치 = \(String(isTurnedOn))")
            }
            TextField("test", text: $myText)
        }
    }
}

struct MyBinding_Previews: PreviewProvider {
    static var previews: some View {
        MyBinding()
    }
}
