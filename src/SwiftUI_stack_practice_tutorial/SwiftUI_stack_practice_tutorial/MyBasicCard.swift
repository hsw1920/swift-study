//
//  MyBasicCard.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by 홍승완 on 2023/04/15.
//

import SwiftUI

struct MyBasicCard: View {
    var body: some View {
        HStack{
            Image(systemName: "flame.fill")
                .font(.system(size: 40))
                
            VStack(alignment: .leading, spacing: 0) {
                Divider().opacity(0)
//                Rectangle().frame(height: 0)
                Text("유튭 라이브버닝")
                    .font(.system(size: 23))
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                Text("10 AM - 11 AM")
            }
        }
        .padding(20)
        .foregroundColor(Color.white)
        .background(Color.purple)
        .cornerRadius(20)
        
    
    }
}

struct MyBasicCard_Previews: PreviewProvider {
    static var previews: some View {
        MyBasicCard()
    }
}
