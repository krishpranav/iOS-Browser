//
//  SettingsView.swift
//  iOS-Browser
//
//  Created by Krisna Pranav on 04/04/25.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var browserVM: BrowserViewModel

    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Bookmarks").foregroundColor(Theme.accent)) {
                    ForEach(browserVM.bookmarks) { bookmark in
                        Button(action: {
                            // Would implement opening bookmark here
                        }) {
                            VStack(alignment: .leading) {
                                Text(bookmark.title)
                                    .foregroundColor(Theme.text)
                                Text(bookmark.url.absoluteString)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete(perform: browserVM.removeBookmark)
                }

                Section(header: Text("History").foregroundColor(Theme.accent)) {
                    ForEach(browserVM.history) { item in
                        VStack(alignment: .leading) {
                            Text(item.title)
                                .foregroundColor(Theme.text)
                            Text(item.url.absoluteString)
                                .font(.caption)
                                .foregroundColor(.gray)
                            Text(item.date.formatted())
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    }

                    Button("Clear History") {
                        browserVM.clearHistory()
                    }
                    .foregroundColor(.red)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        browserVM.showSettings = false
                    }
                    .foregroundColor(Theme.accent)
                }
            }
        }
    }
}
