//
//  DetailViewController.swift
//  NewsReader
//
//  Created by 高橋 京介 on 2017/10/26.
//  Copyright © 2017年 Kyosuke Takahashi. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController : UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var link:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: self.link) {
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
    }
}
