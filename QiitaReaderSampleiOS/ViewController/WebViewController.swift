//
//  WebViewController.swift
//  QiitaReaderSampleiOS
//
//  Created by 五十嵐伸雄 on 2023/09/09.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    var url: URL?
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
    }

    private func setUpLayout() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: containerView.bounds, configuration: webConfiguration)
        webView.uiDelegate = self
        containerView.addSubview(webView)

        webView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: containerView.topAnchor),
            webView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            webView.leftAnchor.constraint(equalTo: containerView.leftAnchor),
            webView.rightAnchor.constraint(equalTo: containerView.rightAnchor)
        ])

        if let symbolName = closeButton.titleLabel?.text {
            closeButton.setTitle("", for: .normal)
            closeButton.setImage(UIImage(systemName: symbolName), for: .normal)
        }

        if let url = url {
            let request = URLRequest(url: url)
            webView.load(request)
        }
        containerView.bringSubviewToFront(closeButton)
    }

    @IBAction func closeWebView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
