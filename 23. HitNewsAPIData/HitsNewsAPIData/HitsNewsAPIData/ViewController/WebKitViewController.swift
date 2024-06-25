//
//  WebKitViewController.swift
//  HitsNewsAPIData
//
//  Created by Shivam Shishangia on 25/06/24.
//

import UIKit
import WebKit

class WebKitViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!

    var articleURLString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension WebKitViewController {
    private func setupUI() {
        if let articleURL = APIHelper.shared.getAPIURL(from: articleURLString) {
            let request = URLRequest(url: articleURL)
            webView.load(request)
        }
    }
}
