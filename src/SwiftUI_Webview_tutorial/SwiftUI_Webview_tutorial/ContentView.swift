//
//  ContentView.swift
//  SwiftUI_Webview_tutorial
//
//  Created by 홍승완 on 2023/04/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            HStack {
                NavigationLink(destination:
                    MyWebView(urlToLoad: "https://www.naver.com")
                    .edgesIgnoringSafeArea(.all)
                ){
                    Text("네이버")
                        .bold()
                        .padding(20)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                        .font(.system(size: 20))
                }
                NavigationLink(destination:
                    MyWebView(urlToLoad: "https://www.daum.net")
                    .edgesIgnoringSafeArea(.all)
                ){
                    Text("다음")
                        .bold()
                        .padding(20)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                        .font(.system(size: 20))
                }
                NavigationLink(destination:
                    MyWebView(urlToLoad: "https://www.google.com")
                    .edgesIgnoringSafeArea(.all)
                ){
                    Text("구글")
                        .bold()
                        .padding(20)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                        .font(.system(size: 20))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
