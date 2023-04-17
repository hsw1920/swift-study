//
//  MyPicker.swift
//  TodaysSwiftUI
//
//  Created by 홍승완 on 2023/04/17.
//

import SwiftUI

struct MyPicker: View {
    @State var pickedItem: String = "0"
    var body: some View {
        VStack{
            Text(pickedItem)
            Picker(selection: $pickedItem,
                   label: Text("Picker")) {
                Text("1 입니다.").tag("1dd")
                Text("2 입니다.").tag("2dd")
            }
//                   .pickerStyle(.inline)
//                   .pickerStyle(.menu)
//                   .pickerStyle(.segmented)
                   .pickerStyle(.wheel)
                   .background(.green)
                   .cornerRadius(13)
                   .padding()
        }
        
    }
}

struct MyPicker_Previews: PreviewProvider {
    static var previews: some View {
        MyPicker()
    }
}
