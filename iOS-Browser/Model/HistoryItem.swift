//
//  HistoryItem.swift
//  iOS-Browser
//
//  Created by Krisna Pranav on 04/04/25.
//

import Foundation

struct HistoryItem: Identifiable, Codable {
    let id: UUID
    var title: String
    var url: URL
    var date: Date

    init(id: UUID, title: String, url: URL, date: Date = Date()) {
        self.id = id
        self.title = title
        self.url = url
        self.date = date
    }
}
