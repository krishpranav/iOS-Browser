//
//  iOS_BrowserApp.swift
//  iOS-Browser
//
//  Created by Krisna Pranav on 04/04/25.
//

import SwiftUI

@main
struct iOS_BrowserApp: App {
    init() {
        Theme.navigationBarAppearance()
    }

    var body: some Scene {
        WindowGroup {
            BrowserView()
                .preferredColorScheme(.dark)
        }
    }
}
