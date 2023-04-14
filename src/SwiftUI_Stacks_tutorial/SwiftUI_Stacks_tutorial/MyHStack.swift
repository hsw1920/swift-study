//
//  MyHStack.swift
//  SwiftUI_Stacks_tutorial
//
//  Created by 홍승완 on 2023/04/14.
//

import SwiftUI

struct MyHStack: View {
    var body: some View {
        
        HStack {
//            Divider()
//            Rectangle()
//                .frame(width: 100)
//                .foregroundColor(Color.red)
            
//            Rectangle()
//                .frame(width: 100, height: 100)
//                .foregroundColor(Color.red)
            
            Image(systemName: "flame.fill")
                .foregroundColor(.white)
                .font(.system(size: 70))
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.yellow)
            Rectangle()
                .frame(width: 100, height: 100)
                .foregroundColor(Color.blue)
        }
        .padding()
        .background(Color.green)
        
    }
}

struct Previews_MyHStack_Previews: PreviewProvider {
    static var previews: some View {
        MyHStack()
    }
}
