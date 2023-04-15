//
//  MyProjectCard.swift
//  SwiftUI_stack_practice_tutorial
//
//  Created by 홍승완 on 2023/04/15.
//

import SwiftUI

// 참조형
struct MyProjectCard: View {
    
    // 값 -> 변수로 사용할 수 있게 해줌
    @State var shouldShowAlert: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // 글자만 적용됨 -> Divider or frame으로 적용시켜줌!
            Rectangle().frame(height: 0)
            
            Text("정대리 유튭 프로젝트")
                .font(.system(size: 23))
                .fontWeight(.black)
                .padding(.bottom, 5)
            Text("10 AM - 11 AM")
                .foregroundColor(.secondary)
            
            Spacer().frame(height: 20)
            HStack{
                Image("1")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color.red)
                    }
                Image("2")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color.blue)
                    }
                Image("3")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay {
                        Circle()
                            .stroke(lineWidth: 3)
                            .foregroundColor(Color.green)
                    }
                Spacer()
                Button(action: {
                    print("확인버튼 클릭")
                    self.shouldShowAlert = true
                }){
                    Text("확인")
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                        .padding()
                        .frame(width: 80)
                        .background(Color.blue)
                        .cornerRadius(20)
                }.alert(isPresented: $shouldShowAlert) {
                    Alert(title: Text("알림창입니다"))
                }
                
            }
        }
        .padding(30)
        .background(Color.yellow)
        .cornerRadius(20)
    }
}

struct MyProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        MyProjectCard()
    }
}
