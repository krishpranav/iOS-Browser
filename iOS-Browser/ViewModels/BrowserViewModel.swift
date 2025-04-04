//
//  BrowserViewModel.swift
//  iOS-Browser
//
//  Created by Krisna Pranav on 04/04/25.
//

import Foundation
import Combine

class BrowserViewModel: ObservableObject {
    @Published var tabs: [Tab] = [Tab(title: "New Tab")]
    @Published var selectedTabId: UUID?
    @Published var showTabView = false
    @Published var bookmarks: [Bookmark] = []
    @Published var history: [HistoryItem] = []
    @Published var showSettings = false

    var selectedTab: Tab? {
        tabs.first { $0.id == selectedTabId }
    }

    init() {
        selectedTabId = tabs.first?.id
        loadBookmarks()
        loadHistory()
    }

    func addTab() {
        let newTab = Tab(title: "New Tab")
        tabs.append(newTab)
        selectedTabId = newTab.id
    }

    func closeTab(id: UUID) {
        tabs.removeAll { $0.id == id }
        if selectedTabId == id {
            selectedTabId = tabs.last?.id
        }
        if tabs.isEmpty {
            addTab()
        }
    }

    func addBookmark(title: String, url: URL) {
        let bookmark = Bookmark(title: title, url: url)
        bookmarks.append(bookmark)
        saveBookmarks()
    }

    func removeBookmark(at indexSet: IndexSet) {
        bookmarks.remove(atOffsets: indexSet)
        saveBookmarks()
    }

    func addHistoryItem(title: String, url: URL) {
        let historyItem = HistoryItem(title: title, url: url)
        history.insert(historyItem, at: 0)
        saveHistory()
    }

    private func saveBookmarks() {
        if let encoded = try? JSONEncoder().encode(bookmarks) {
            UserDefaults.standard.set(encoded, forKey: "bookmarks")
        }
    }

    private func loadBookmarks() {
        if let data = UserDefaults.standard.data(forKey: "bookmarks"),
           let decoded = try? JSONDecoder().decode([Bookmark].self, from: data) {
            bookmarks = decoded
        }
    }

    private func saveHistory() {
        if let encoded = try? JSONEncoder().encode(history) {
            UserDefaults.standard.set(encoded, forKey: "history")
        }
    }

    private func loadHistory() {
        if let data = UserDefaults.standard.data(forKey: "history"),
           let decoded = try? JSONDecoder().decode([HistoryItem].self, from: data) {
            history = decoded
        }
    }

    func clearHistory() {
        history.removeAll()
        saveHistory()
    }
}
