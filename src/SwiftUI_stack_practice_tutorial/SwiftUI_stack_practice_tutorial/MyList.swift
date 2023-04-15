//
//  MyList.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by 홍승완 on 2023/04/15.
//

import SwiftUI

struct MyList: View {
    
    @Binding var isNavigationBarHidden: Bool
    
    init(isNavigationBarHidden: Binding<Bool> = .constant(false)) {
        _isNavigationBarHidden = isNavigationBarHidden
    }
    var body: some View {
        List{
            Section(
                header: Text("오늘 할 일")
                    .font(.headline)
                    .foregroundColor(Color.black),
                footer: Text("footer")
            ){
                ForEach(1...3, id: \.self) { itemIndex in
                    MyCard(icon: "book.fill", title: "책읽기\(itemIndex)", start: "1 PM", end: "3 PM", bgColor: Color.green)
                }
                .listRowSeparator(.hidden)
            }
            .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            
            Section(
                header: Text("내일 할 일")
                    .font(.headline)
                    .foregroundColor(Color.black),
                footer: Text("footer")
            ){
                ForEach(1...3, id: \.self) { itemIndex in
                    MyCard(icon: "book.fill", title: "책읽기\(itemIndex)", start: "1 PM", end: "3 PM", bgColor: Color.blue)
                }
                .listRowSeparator(.hidden)
            }
            .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
            .listRowBackground(Color.yellow)
        }
        .listStyle(.grouped)
//        .listStyle(PlainListStyle())
        .navigationTitle("내 목록")
        .onAppear{
            self.isNavigationBarHidden = false
        }
        
    } // NavigationView
}

struct MyList_Previews: PreviewProvider {
    static var previews: some View {
        MyList()
    }
}
