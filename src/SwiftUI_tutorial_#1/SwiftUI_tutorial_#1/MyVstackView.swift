//
//  MyVstackView.swift
//  SwiftUI_tutorial_#1
//
//  Created by 홍승완 on 2023/04/11.
//

import SwiftUI

struct MyVstackView: View {
    @Binding var isActivated: Bool
    
    init(isActivated:Binding<Bool> = .constant(true)) { // 기본값 true
        _isActivated = isActivated
    }
    var body: some View {
        VStack {
            Text("1!")
                .font(.system(size: 60))
            Text("2!")
                .font(.system(size: 60))
            Text("3!")
                .font(.system(size: 60))
        }
        .bold()
        .background(self.isActivated ? Color.green : Color.red)
        .padding(self.isActivated ? 10 : 0)
    }
}

struct MyVstackView_Previews: PreviewProvider {
    static var previews: some View {
        MyVstackView()
    }
}
