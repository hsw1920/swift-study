//
//  MyZStack.swift
//  SwiftUI_Stacks_tutorial
//
//  Created by 홍승완 on 2023/04/14.
//

import SwiftUI

struct MyZStack: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: 50, height: 50)
                .foregroundColor(Color.yellow)
                .zIndex(2)
                .offset(y: -50)
//                .padding(.bottom, 50)
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.red)
                .zIndex(1)
            Rectangle()
                .frame(width: 150, height: 150)
                .foregroundColor(Color.blue)
                .zIndex(0) // default값이 0임
        }
        
    }
}

struct Previews_MyZStack_Previews: PreviewProvider {
    static var previews: some View {
        MyZStack()
    }
}
