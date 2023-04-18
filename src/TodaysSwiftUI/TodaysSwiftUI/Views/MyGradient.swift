//
//  MyGradient.swift
//  TodaysSwiftUI
//
//  Created by 홍승완 on 2023/04/18.
//

import SwiftUI

struct MyGradient: View {
    var body: some View {
        ZStack{
            //            LinearGradient(
            //                colors: [.red,.orange,.yellow,.green,.blue,.indigo,.purple],
            //                startPoint: .topLeading,
            //                endPoint: .bottomTrailing
            //            )
            //            .ignoresSafeArea()
            
//            AngularGradient(gradient: Gradient(colors: [.red,.orange,.yellow,.green,.blue,.indigo,.purple]), center: .leading)
            EllipticalGradient(colors: [.red,.orange,.yellow,.green,.blue,.indigo,.purple],
                               center: .center,
                               startRadiusFraction: 0.6,
                               endRadiusFraction: 0.05
            )
            Text("Wan")
                .padding()
                .background(LinearGradient(
                    colors: [.red,.orange,.yellow,.green,.blue,.indigo,.purple],
                    startPoint: .topTrailing,
                    endPoint: .bottomLeading
                ))
                .cornerRadius(20)
            
        }
    }
}

struct MyGradient_Previews: PreviewProvider {
    static var previews: some View {
        MyGradient()
    }
}
