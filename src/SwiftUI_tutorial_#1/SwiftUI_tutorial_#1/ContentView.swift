//
//  ContentView.swift
//  SwiftUI_tutorial_#1
//
//  Created by 홍승완 on 2023/04/11.
//

import SwiftUI

struct ContentView: View {
    @State private var isActivated: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                HStack{
                    MyVstackView()
                    MyVstackView()
                    MyVstackView()
                }
                .padding(isActivated ? 50.0 : 10.0)
                .background(isActivated ? .yellow : .black)
                // 탭 제스처 추가
                .onTapGesture {
                    print("HStack이 클릭됨")
                    withAnimation {
                        self.isActivated.toggle()
                    }
                }
                .padding()
                
                // 네비게이션 버튼(링크)
                NavigationLink(destination: MyTextView()) {
                    Text("네비게이션")
                        .font(.system(size: 40))
                        .fontWeight(.bold)
                        .padding()
                        .background(.orange)
                        .foregroundColor(.white)
                        .cornerRadius(30)
                }
                .padding(.top, 50)
            }
        }
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
            Text("1!")
                .font(.system(size: 60))
            Text("2!")
                .font(.system(size: 60))
            Text("3!")
                .font(.system(size: 60))
        }
        .background(.orange)
    }
}
