//
//  MyStepper.swift
//  TodaysSwiftUI
//
//  Created by 홍승완 on 2023/04/16.
//

import SwiftUI

struct MyStepper: View {
    @State var myLevel: Int = 1
    @State private var value = 0
    let colors: [Color] = [.orange, .red, .gray, .blue,
                           .green, .purple, .pink]
    func incrementStep() {
        value += 1
        if value >= colors.count { value = 0 }
    }
    
    func decrementStep() {
        value -= 1
        if value < 0 { value = colors.count - 1 }
    }
    var body: some View {
        //        Stepper(value: $myLevel, in: 1...10) {
        //            Text("Level \(myLevel)")
        //        }
        //        .padding()
        //        .colorMultiply(.red)
        
        Stepper {
            Text("Value: \(value) Color: \(colors[value].description)")
        } onIncrement: {
            incrementStep()
        } onDecrement: {
            decrementStep()
        }
        .padding(5)
        .colorMultiply(colors[value])
//        .background(colors[value])
        
    }
}

struct MyStepper_Previews: PreviewProvider {
    static var previews: some View {
        MyStepper()
    }
}
