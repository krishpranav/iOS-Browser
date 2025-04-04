//
//  Bookmark.swift
//  iOS-Browser
//
//  Created by Krisna Pranav on 04/04/25.
//

import Foundation

struct Bookmark: Identifiable, Codable {
    let id: UUID
    var title: String
    var url: URL

    init(id: UUID = UUID(), title: String, url: URL) {
        self.id = id
        self.title = title
        self.url = url
    }
}
