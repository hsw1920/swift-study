//
//  MyNavigationView.swift
//  TodaysSwiftUI
//
//  Created by 홍승완 on 2023/04/15.
//

import SwiftUI

struct MyNavigationView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("MyView1")) {
                VStack{
                    ZStack{
                        Color.green
                        Text("test")
                    }
                }
            }
            .navigationTitle("Hello")
            
        }
        
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
