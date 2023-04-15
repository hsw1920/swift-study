//
//  ContentView.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by 홍승완 on 2023/04/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(alignment: .leading, spacing: 0){
                HStack{
                    Image(systemName: "line.horizontal.3")
                        .font(.largeTitle)
                    Spacer()
                    Image(systemName: "person.crop.circle.fill")
                        .font(.largeTitle)
                }
                .padding(20)
                
                Text("정대리 할 일 목록")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                    .padding(.horizontal, 20)
                
                ScrollView() {
                    VStack {
                        MyProjectCard()
                        MyCard(icon: "tray.fill", title: "책상 정리하기", start: "10 AM", end: "11 AM", bgColor: Color.blue)
                        MyCard(icon: "book.fill", title: "책읽기", start: "1 PM", end: "3 PM", bgColor: Color.green)
                        MyCard(icon: "flag.fill", title: "도서관 출발", start: "5 PM", end: "6 PM", bgColor: Color.red)
                        MyCard(icon: "mic.fill", title: "코인 노래방", start: "8 PM", end: "10 PM", bgColor: Color.orange)
                        
                    }
                    .padding(20)
                }
            }

            
            Circle()
                .foregroundColor(Color.yellow)
                .frame(width: 60, height: 60)
                
                .overlay {
                    Image(systemName: "plus")
                        .font(.system(size: 30))
                        .foregroundColor(Color.white)
                }
                .padding(10)
                .shadow(radius: 20)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
