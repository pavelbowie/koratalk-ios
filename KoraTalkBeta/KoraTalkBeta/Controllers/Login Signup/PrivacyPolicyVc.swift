//
//  PrivacyPolicyVc.swift
//  KoraTalkBeta
//
//  Created by Pavel Mac on 29/10/2024.
//  Copyright © 2024 Apricus-LLP. All rights reserved.
//

import UIKit
import Loaf
import WebKit
import ProgressHUD

class PrivacyPolicyVc: BaseVc {
    
    @IBOutlet weak var webView: WKWebView!
    
    var policyUrl = ""
    
    //MARK:- View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        //loadPrivacyPolicy()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        ProgressHUD.dismiss()
    }
    
    //MARK:- Preparing UI
    func prepareUI() {
        //webView.uiDelegate = self
        //webView.navigationDelegate = self
        ProgressHUD.colorAnimation = #colorLiteral(red: 0.02352941176, green: 0.7803921569, blue: 0.3333333333, alpha: 1)
        ProgressHUD.animationType = .circleRotateChase
        ProgressHUD.dismiss()
    }
    
    //MARK:- Load Privacy Policy in WKWebView
    func loadPrivacyPolicy() {
        if isInternetConnected() {
            guard let urlString = URL(string: policyUrl) else {
                ProgressHUD.dismiss()
                return
            }
            webView.load(URLRequest(url: urlString))
            webView.backgroundColor = .clear
        } else {
            ProgressHUD.dismiss()
            Loaf("You're not connected to the Internet", state: .info, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    //MARK:- Dismiss Screen
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK:- WebView Delegates
extension PrivacyPolicyVc: WKUIDelegate, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        ProgressHUD.animate("Please Wait", interaction: false)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        ProgressHUD.dismiss()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        ProgressHUD.dismiss()
        Loaf("Something went wrong while displaying privacy policy.", state: .info, presentingDirection: .vertical, dismissingDirection: .vertical, sender: self).show()
    }
}
