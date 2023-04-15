//
//  MyAppear.swift
//  TodaysSwiftUI
//
//  Created by 홍승완 on 2023/04/15.
//

import SwiftUI

struct MyAppear: View {
    
    @State var name: String = "NoName"
    @State var isPresented: Bool = false
    
    var body: some View {
        
        NavigationStack {
            NavigationLink(value: "text") {
                Text(name)
                    .onAppear{
                        print("On Appear")
                        name = "wan"
                    }
                    .onDisappear {
                        print("On Disappear")
                    }
                
            }
            .navigationDestination(for: String.self) { value in
                Text(value)
            }
        }
        // 아래는 호출 안됨~
        .onAppear{
            print("On Appear2")
        }
        .onDisappear {
            print("On Disappear2")
        }

    }
}

struct MyAppear_Previews: PreviewProvider {
    static var previews: some View {
        MyAppear()
    }
}
