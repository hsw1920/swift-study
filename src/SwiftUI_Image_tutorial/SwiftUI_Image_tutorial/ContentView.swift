//
//  ContentView.swift
//  SwiftUI_Image_tutorial
//
//  Created by 홍승완 on 2023/04/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("myImage")
                    .frame(height: 10)
                    .offset(y: -110)
                CircleImageView()
                HStack{
                    NavigationLink(destination: MyWebView(urlToLoad: "https://www.youtube.com/channel/UCutO2H_AVmWHbzvE92rpxjA/")
                    ){
                        Text("구독하러 가기")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(.red)
                            .cornerRadius(20)
                    }
                    NavigationLink(destination: MyWebView(urlToLoad: "https://open.kakao.com/o/gxOOKJec")
                    ){
                        Text("오픈깨톡방 가기")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(.orange)
                            .cornerRadius(20)
                    }
                }
                .padding()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
