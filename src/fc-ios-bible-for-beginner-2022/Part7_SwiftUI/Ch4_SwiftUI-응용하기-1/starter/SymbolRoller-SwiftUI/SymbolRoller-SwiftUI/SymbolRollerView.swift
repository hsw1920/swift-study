//
//  ContentView.swift
//  SymbolRoller-SwiftUI
//
//  Created by joonwon lee on 2022/05/21.
//

import SwiftUI

struct SymbolRollerView: View {
    
    let symbols: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]
    @State var idx = 0
    
    @State var imageName: String = "moon"
    
    var body: some View {
        VStack{
            Spacer()
            Image(systemName: imageName)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Spacer()
            Text(imageName)
                .font(.system(size: 40, weight: .bold))
            Button {
                print("Button Tapped")
                //imageName = symbols.randomElement()!
                imageName = symbols[idx]
                idx+=1
                if idx >= symbols.count {
                    idx = 0
                }
            } label: {
                HStack{
                    Image(systemName: "arrow.3.trianglepath")
                    VStack{
                        Text("Reload")
                            .font(.system(size: 30, weight: .bold, design: .default))
                        Text("click me to reload")
                    }
                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(.pink)
//            .clipShape(Capsule())
            .cornerRadius(40)
//            .padding()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SymbolRollerView()
    }
}
