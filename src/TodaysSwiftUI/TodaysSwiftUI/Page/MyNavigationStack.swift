//
//  MyNavigationStack.swift
//  TodaysSwiftUI
//
//  Created by 홍승완 on 2023/04/15.
//

import SwiftUI

struct MyNavigationStack: View {
    var body: some View {
        NavigationStack {
            // 눌렀을 때 값을 넘겨주고
            NavigationLink(value: 3) {
                Text("test3")
            }
            // 넘긴 값을 가지고 destination으로 이동
            .navigationDestination(for: Int.self) { value in
                Text("Leeo tried \(value) times")
            }
        }
    }
}

struct MyNavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationStack()
    }
}
