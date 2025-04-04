//
//  TabViewModel.swift
//  iOS-Browser
//
//  Created by Krisna Pranav on 04/04/25.
//

import Foundation
import WebKit

class TabViewModel: ObservableObject {
    @Published var currentURL: URL?
    @Published var pageTitle: String = ""
    @Published var isLoading: Bool = false
    @Published var addressBarText: String = ""
    @Published var canGoBack: Bool = false
    @Published var canGoForward: Bool = false

    private var webView: WKWebView?

    func setWebView(_ webView: WKWebView) {
        self.webView = webView
        updateNavigationState()
    }

    func loadURL(_ url: URL) {
        currentURL = url
        addressBarText = url.absoluteString
        webView?.load(URLRequest(url: url))
    }

    func goBack() {
        webView?.goBack()
        updateNavigationState()
    }

    func goForward() {
        webView?.goForward()
        updateNavigationState()
    }

    func reload() {
        webView?.reload()
    }

    func stopLoading() {
        webView?.stopLoading()
    }

    func updateNavigationState() {
        canGoBack = webView?.canGoBack ?? false
        canGoForward = webView?.canGoForward ?? false
    }

    func search(text: String) {
        if let url = URL(string: text), url.scheme != nil {
            loadURL(url)
        } else {
            let searchQuery = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
            if let url = URL(string: "https://www.google.com/search?q=\(searchQuery)") {
                loadURL(url)
            }
        }
    }
}
