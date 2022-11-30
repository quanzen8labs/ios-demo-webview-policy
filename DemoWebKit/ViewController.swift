//
//  ViewController.swift
//  DemoWebKit
//
//  Created by macbook on 24/11/2022.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        webView.load(URLRequest(url: URL(string: "https://infoheap.com/html-form-create-request-and-submit/")!))
        // Do any additional setup after loading the view.
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
        if let httpBody = navigationAction.request.httpBody {
            if let params = String(data: httpBody, encoding: .utf8) {
                let uiAlertViewController = UIAlertController(
                    title: navigationAction.request.url?.absoluteString ?? "", message: "Body params: \n \(params)", preferredStyle: .alert)
                uiAlertViewController.addAction(UIAlertAction(title: "OK", style: .cancel))
                self.present(uiAlertViewController, animated: true)
            }
        }
        return .allow
    }
}

