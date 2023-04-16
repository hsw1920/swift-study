//
//  MySlider.swift
//  TodaysSwiftUI
//
//  Created by 홍승완 on 2023/04/16.
//

import SwiftUI

struct MySlider: View {
    @State var myPoint: Float = 0.5
    
    var body: some View {
        VStack{
            Text(myPoint.description)
            Slider(value: $myPoint) {
                Text("My Slider")
            } minimumValueLabel: {
                Text("0")
            } maximumValueLabel: {
                Text("100")
            }
            .tint(.orange)
        }
        
    }
}

struct MySlider_Previews: PreviewProvider {
    static var previews: some View {
        MySlider()
    }
}
