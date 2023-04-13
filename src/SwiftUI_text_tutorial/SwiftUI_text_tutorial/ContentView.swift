//
//  ContentView.swift
//  SwiftUI_text_tutorial
//
//  Created by 홍승완 on 2023/04/13.
//

import SwiftUI

struct ContentView: View {
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
//        formatter.dateFormat = "YYYY년_ M월_ d일_"
        formatter.dateStyle = .long
        return formatter
    }()
    
    var today = Date()
    
    var trueOrFalse: Bool = false
    
    var number: Int = 123
    
    var body: some View {
        VStack{
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                .tracking(2) // 자간
            
                .font(.system(.body, design: .rounded))
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .lineSpacing(10)
                .shadow(color: Color.gray, radius: 3, x: 4, y: 2)
            
                .truncationMode(.head) // 글자가 영역 넘어갈시 자르는 부분
            
            //                .padding(.vertical, 20)
            //                .padding(.horizontal, 20)
                .padding(.all, 20)
            //                .padding() // padding은 중복하여 값이 겹쳐짐!
                .background(Color.yellow)
                .cornerRadius(20)
                .padding()
                .background(Color.green)
                .cornerRadius(20)
                .padding()
                .background(Color.blue)
                .cornerRadius(20)
            Text("안녕하세요!!")
                .background(Color.gray)
                .foregroundColor(Color.white)
            Text("오늘의 날짜입니다 : \(today, formatter: ContentView.dateFormat)")
            Text("참 혹은 거짓: \(String(trueOrFalse))")
            Text("숫자입니다: \(number)")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
