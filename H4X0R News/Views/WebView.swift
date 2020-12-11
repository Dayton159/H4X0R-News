//
//  WebView.swift
//  H4X0R News
//
//  Created by Dayton on 09/07/20.
//  Copyright © 2020 Dayton. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI


//allows us to create a swiftUI view that represents a UI kit View
struct WebView:UIViewRepresentable {
    
    let urlString:String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                
                uiView.load(request)
            }
        }
    }
    
}
