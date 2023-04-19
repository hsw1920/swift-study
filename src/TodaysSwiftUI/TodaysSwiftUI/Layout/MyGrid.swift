//
//  MyGrid.swift
//  TodaysSwiftUI
//
//  Created by 홍승완 on 2023/04/19.
//

import SwiftUI

struct MyGrid: View {
    var body: some View {
        
//        LazyHGrid(rows: [GridItem(.fixed(100)),
//                         GridItem(.fixed(100)),
//                         GridItem(.fixed(100))]) {
//
//        }
        
        LazyVGrid(columns: [GridItem(.fixed(100)),
                            GridItem(.fixed(100)),
                            GridItem(.fixed(100))]) {
            
            Image(systemName: "bolt")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(.purple)
            Image(systemName: "bolt")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(.purple)
            Image(systemName: "bolt")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(.purple)
            Text("4")
                .frame(width: 100, height: 100)
                .background(.purple)
            Text("5")
                .frame(width: 100, height: 100)
                .background(.purple)
            Text("6")
                .frame(width: 100, height: 100)
                .background(.purple)
            Text("7")
                .frame(width: 100, height: 100)
                .background(.purple)
            
        }
    }
}

struct MyGrid_Previews: PreviewProvider {
    static var previews: some View {
        MyGrid()
    }
}
