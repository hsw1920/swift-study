//
//  MyWebView.swift
//  SwiftUI_Webview_tutorial
//
//  Created by 홍승완 on 2023/04/13.
//

import SwiftUI
import WebKit

// uikit의 uiview를 사용할 수 있도록 한다.
// UIViewControllerRepresentable
struct MyWebView: UIViewRepresentable {
    
    
    typealias Context = UIViewRepresentableContext<MyWebView>
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    

    var urlToLoad: String
    
    // UIView 만들기
    func makeUIView(context: Context) -> WKWebView {
        // unwrapping
        guard let url = URL(string: self.urlToLoad) else { return WKWebView() }
        
        // 웹뷰 인스턴스 생성
        let webview = WKWebView()
        
        // 웹뷰 로드
        webview.load(URLRequest(url: url))
        
        return webview
    }


    // update UIView
    
    
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(urlToLoad: "https://www.naver.com")
    }
}
