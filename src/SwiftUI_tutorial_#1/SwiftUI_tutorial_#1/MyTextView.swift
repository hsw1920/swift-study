//
//  MyTextView.swift
//  SwiftUI_tutorial_#1
//
//  Created by 홍승완 on 2023/04/11.
//

import SwiftUI

struct MyTextView: View {
    @Binding var isActivated: Bool
    
    init(isActivated:Binding<Bool> = .constant(true)) { // 기본값 true
        _isActivated = isActivated
    }
    @State private var index: Int = 0
    private let backgroundColors = [
        Color.red, Color.yellow, Color.blue, Color.green, Color.orange
    ]
    var body: some View {
        VStack{
            Spacer()
            
            Text("배경 아이템 인덱스 \(self.index)")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
            
            Text("활성화 상태: \(String(isActivated))")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(self.isActivated ? Color.yellow : Color.gray)
                .background(Color.black)
            
            Spacer()
        }
        .background(backgroundColors[index])
        .edgesIgnoringSafeArea(.all)
        .onTapGesture {
            print("배경아이템이 클릭되었음")
            if self.index == self.backgroundColors.count-1 {
                self.index = 0
            } else {            
                self.index += 1
            }
        }
    }
}

struct MyTextView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextView()
    }
}
