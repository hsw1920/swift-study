//
//  MyCard.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by 홍승완 on 2023/04/15.
//

import SwiftUI

struct MyCard: View {
    
    var icon: String
    var title: String
    var start: String
    var end: String
    var bgColor: Color
    
    var body: some View {
        HStack{
            Image(systemName: icon)
                .font(.system(size: 40))
                
            VStack(alignment: .leading, spacing: 0) {
                Divider().opacity(0)
//                Rectangle().frame(height: 0)
                Text(title)
                    .font(.system(size: 23))
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                Text("\(start) - \(end)")
            }
        }
        .padding(20)
        .foregroundColor(Color.white)
        .background(bgColor)
        .cornerRadius(20)
        
    
    }
}

struct MyCard_Previews: PreviewProvider {
    static var previews: some View {
        MyCard(icon: "book.fill", title: "책읽기", start: "1 PM", end: "3 PM", bgColor: Color.green)
    }
}
