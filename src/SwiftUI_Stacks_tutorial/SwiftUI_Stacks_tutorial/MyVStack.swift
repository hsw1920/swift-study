//
//  MyVStack.swift
//  SwiftUI_Stacks_tutorial
//
//  Created by 홍승완 on 2023/04/14.
//

import SwiftUI

struct MyVStack: View {
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            
            Text("글자")
                .font(.system(size: 30))
                .fontWeight(.heavy)
//                .padding(.bottom, 100)
            
            Divider().opacity(0)
            
//            Rectangle().frame(height: 1)
            
            
            Rectangle() // default 값 기본으로 전체를 채움 (frame 적용됨)
                .frame(width: 100, height: 100)
                .foregroundColor(Color.red)
//                .padding(.vertical, 100)
            
            Rectangle() // default 값 기본으로 전체를 채움 (frame 적용됨)
                .frame(width: 100, height: 100)
                .foregroundColor(Color.orange)
            Spacer()
                .frame(height: 50)
            Rectangle() // default 값 기본으로 전체를 채움 (frame 적용됨)
                .frame(width: 100, height: 100)
                .foregroundColor(Color.blue)
            Spacer()
                .frame(height: 50)
        }
        .frame(width: 300)
        .background(Color.green)
        .padding(.all, 1)
//        .edgesIgnoringSafeArea(.all)
    }
}

struct MyVStack_Previews: PreviewProvider {
    static var previews: some View {
        MyVStack()
    }
}
