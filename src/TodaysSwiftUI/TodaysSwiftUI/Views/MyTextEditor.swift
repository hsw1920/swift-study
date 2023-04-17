//
//  MyTextEditor.swift
//  TodaysSwiftUI
//
//  Created by 홍승완 on 2023/04/17.
//

import SwiftUI

struct MyTextEditor: View {
    @State var inputText: String = "default"
    var body: some View {
        VStack{
            // TextField와의 차이점? -> 한 줄
            // TextEditor -> 장문 여러 줄
            TextEditor(text: $inputText)
                .padding()
                .foregroundColor(.orange)
                .background(.green)
                .frame(height: 300)
                .multilineTextAlignment(.center)
                .onChange(of: inputText) { newValue in
                    print(newValue.count)
                }
        }
    }
}

struct MyTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        MyTextEditor()
    }
}
