//
//  ContentView.swift
//  Planner
//
//  Created by Demian on 2024/03/15.
//

import SwiftUI
import WebKit

struct ContentView: View {
    let webView = WebView(url: "https://www.naver.com")
    
    var body: some View {
        VStack {
            webView
                .frame(width: .infinity, height: .infinity)
            
        }
        .padding()
    }
}

struct WebView: UIViewRepresentable {
    var urlRequest: URLRequest
    private var webView: WKWebView
    
    init(url: String) {
        self.webView = WKWebView()
        self.urlRequest = URLRequest(url: URL(string: url)!)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }
        
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(urlRequest)
    }
        
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject {
        let parent: WebView
        
        init(parent: WebView) {
            self.parent = parent
        }
    }
}

#Preview {
    ContentView()
}
