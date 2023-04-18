//
//  MyBasicAnimation.swift
//  TodaysSwiftUI
//
//  Created by 홍승완 on 2023/04/18.
//

import SwiftUI

struct MyBasicAnimation: View {
    @State var isLightning: Bool = false
    var body: some View {
        VStack{
            Image(systemName: "cloud")
                .offset(x: 0, y: -200)
            HStack{
                Image(systemName: "bolt")
                    .rotationEffect(isLightning ? .degrees(0) : .degrees(180+360))
                    .offset(x: 0, y: isLightning ? 0 : -200)
                    .padding()
                    .animation(.easeInOut(duration: 3), value: isLightning)
                Image(systemName: "bolt")
                    .rotationEffect(isLightning ? .degrees(0) : .degrees(360))
                    .offset(x: 0, y: isLightning ? 0 : -200)
                    .padding()
                    .animation(.easeIn(duration: 3), value: isLightning)
                Image(systemName: "bolt")
                    .offset(x: 0, y: isLightning ? 0 : -200)
                    .padding()
                    .animation(.easeOut(duration: 3), value: isLightning)
            }
            
            Button {
                isLightning.toggle()
            } label: {
                Text("Click")
            }

        }
    }
}

struct MyBasicAnimation_Previews: PreviewProvider {
    static var previews: some View {
        MyBasicAnimation()
    }
}
