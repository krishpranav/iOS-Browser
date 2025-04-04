//
//  Tab.swift
//  iOS-Browser
//
//  Created by Krisna Pranav on 04/04/25.
//

import Foundation

struct Tab: Identifiable, Hashable {
    let id: UUID
    var title: String
    var url: URL?

    init(id: UUID, title: String = "New Tab", url: URL? = nil) {
        self.id = id
        self.title = title
        self.url = url
    }
}
