//
//  WebViewController.swift
//  Sweet Shop
//
//  Created by Виталий Субботин on 30/03/2019.
//  Copyright © 2019 Виталий Субботин. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    var url: URL!
    var webView: WKWebView!
    var progressView: UIProgressView!
    
    deinit {
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView()
        webView.navigationDelegate = self

        view = webView
        
        let request = URLRequest(url: url)
        webView.load(request)
        
        webView.allowsBackForwardNavigationGestures = true
        
        progressView = UIProgressView(progressViewStyle: .default)
        
        progressView.sizeToFit()

        let progressButton = UIBarButtonItem(customView: progressView)

        toolbarItems = [progressButton]

        navigationController?.isToolbarHidden = false

        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
        navigationController?.isToolbarHidden = true
    }

}
