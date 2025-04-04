//
//  TabView.swift
//  iOS-Browser
//
//  Created by Krisna Pranav on 04/04/25.
//

import SwiftUI

struct TabView: View {
    @ObservedObject var browserVM: BrowserViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(browserVM.tabs) { tab in
                    Button(action: {
                        browserVM.selectedTabId = tab.id
                        browserVM.showTabView = false
                    }) {
                        HStack {
                            if browserVM.selectedTabId == tab.id {
                                Image(systemName: "checkmark")
                                    .foregroundColor(Theme.accent)
                            }
                            VStack(alignment: .leading) {
                                Text(tab.title)
                                    .foregroundColor(Theme.text)
                                Text(tab.url?.absoluteString ?? "No URL")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .onDelete { indices in
                    indices.forEach { index in
                        browserVM.closeTab(id: browserVM.tabs[index].id)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Tabs")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Done") {
                        browserVM.showTabView = false
                    }
                    .foregroundColor(Theme.accent)
                }

                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        browserVM.addTab()
                        browserVM.showTabView = false
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(Theme.accent)
                    }
                }
            }
        }
    }
}
