//
//  WebViewController.swift
//  Tumble
//
//  Created by Shilpa M on 16/03/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    var webView : WKWebView!
    
    //get's called before viewDidLoad
    override func loadView() {
       webView = WKWebView()
       webView.navigationDelegate = self
       view = webView
        
      let url = URL(string: "https://www.hackingwithswift.com")!
      webView.load(URLRequest(url: url))
      webView.allowsBackForwardNavigationGestures = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
