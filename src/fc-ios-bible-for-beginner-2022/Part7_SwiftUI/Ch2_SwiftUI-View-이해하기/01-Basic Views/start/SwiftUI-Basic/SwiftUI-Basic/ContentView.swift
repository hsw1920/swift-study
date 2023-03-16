//
//  ContentView.swift
//  SwiftUI-Basic
//
//  Created by 홍승완 on 2023/03/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //            ContentView()
        ButtonView()
        ImageView().padding(16)
        TextView()
            .padding(16)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
