//
//  AkuratecoRedirect3dsVC.swift
//  Sample
//
//  Created by Bodia on 10.03.2021.
//

import UIKit
import WebKit

final class AkuratecoRedirect3dsVC: UIViewController {
    
    var termUrl: String!
    var termUrl3Ds: String!

    var completion: ((Bool) -> Void)?
    
    private lazy var webView = WKWebView()
    private lazy var loader = UIActivityIndicatorView(style: .gray)
    
    override func loadView() {
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        navigationItem.setRightBarButton(.init(title: "Close", style: .plain, target: self, action: #selector(closeAction)),
                                         animated: false)
        
        loader.hidesWhenStopped = true
        loader.stopAnimating()
        loader.translatesAutoresizingMaskIntoConstraints = false
        loader.color = .orange
        view.addSubview(loader)
        
        NSLayoutConstraint.activate([loader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     loader.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        
        webView.load(URLRequest(url: URL(string: termUrl)!))
    }
    
    @objc private func closeAction() {
        dismiss(animated: true, completion: nil)
    }
}

extension AkuratecoRedirect3dsVC: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard navigationAction.request.url?.absoluteString == termUrl3Ds else {
            decisionHandler(.allow)
            return
        }
        
        dismiss(animated: true, completion: nil)
        completion?(true)
        decisionHandler(.cancel)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        loader.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loader.stopAnimating()
    }
}
