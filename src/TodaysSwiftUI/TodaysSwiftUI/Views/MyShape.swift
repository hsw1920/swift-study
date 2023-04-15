//
//  MyShape.swift
//  TodaysSwiftUI
//
//  Created by 홍승완 on 2023/04/16.
//

import SwiftUI

struct MyShape: View {
    var body: some View {
        VStack{
            Spacer()
            
//            Circle()
//                .foregroundColor(.green)
//                .background(.red)
//            Spacer()
            
//            Rectangle()
//            Spacer()
            
//            RoundedRectangle(cornerRadius: 100)
//                .foregroundColor(.yellow)
//                .background(.red)
//            Spacer()
//
//            Ellipse()
//            Spacer()
//
//            Capsule()
//            Spacer()
            
            Image(systemName: "sun.max")
                .resizable()
                .foregroundColor(.white)
                .background(.yellow)
                .clipShape(Circle())
                
            
            Spacer()
        }
        .padding()
        
    }
}

struct MyShape_Previews: PreviewProvider {
    static var previews: some View {
        MyShape()
    }
}
