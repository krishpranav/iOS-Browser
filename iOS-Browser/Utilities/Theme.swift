//
//  Theme.swift
//  iOS-Browser
//
//  Created by Krisna Pranav on 04/04/25.
//

import SwiftUI

struct Theme {
    static let primary = Color.yellow
    static let secondary = Color.black
    static let background = Color.black
    static let text = Color.white
    static let accent = Color.yellow

    static func navigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Theme.background)
        appearance.titleTextAttributes = [.foregroundColor: UIColor(Theme.text)]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(Theme.text)]
        
    }
}
