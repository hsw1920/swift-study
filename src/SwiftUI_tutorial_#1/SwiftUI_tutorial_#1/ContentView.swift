//
//  ContentView.swift
//  SwiftUI_tutorial_#1
//
//  Created by 홍승완 on 2023/04/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            MyVstackView()
            MyVstackView()
            MyVstackView()
        }
        .padding()
        .background(.yellow)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyVstackView: View {
    var body: some View {
        VStack {
            Text("1")
                .font(.system(size: 60))
            Text("2")
                .font(.system(size: 60))
            Text("3")
                .font(.system(size: 60))
        }
        .background(.red)
        .padding()
        .background(.blue)
    }
}
