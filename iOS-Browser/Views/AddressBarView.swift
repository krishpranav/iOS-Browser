//
//  AddressBarView.swift
//  iOS-Browser
//
//  Created by Krisna Pranav on 04/04/25.
//

import SwiftUI

struct AddressBarView: View {
    @ObservedObject var tabVM: TabViewModel
    @ObservedObject var browserVM: BrowserViewModel
    @State private var isEditing = false

    var body: some View {
        HStack {
            if tabVM.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Theme.accent))
                    .padding(.leading, 8)
            } else {
                Button(action: {
                    tabVM.stopLoading()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(Theme.text)
                        .padding(.leading, 8)
                }
            }

            HStack {
                TextField("Search or enter address", text: $tabVM.addressBarText, onCommit: {
                    tabVM.search(text: tabVM.addressBarText)
                    isEditing = false
                })
                .padding(8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .foregroundColor(.black)
                .keyboardType(.webSearch)
                .autocapitalization(.none)
                .disableAutocorrection(true)

                if isEditing {
                    Button(action: {
                        isEditing = false
                        tabVM.addressBarText = tabVM.currentURL?.absoluteString ?? ""
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }) {
                        Text("Cancel")
                            .foregroundColor(Theme.accent)
                    }
                    .transition(.move(edge: .trailing))
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 4)
            .animation(.default, value: isEditing)

            Menu {
                Button(action: {
                    if let url = tabVM.currentURL, let title = tabVM.pageTitle {
                        browserVM.addBookmark(title: title, url: url)
                    }
                }) {
                    Label("Add Bookmark", systemImage: "bookmark")
                }

                Button(action: {
                    browserVM.addTab()
                }) {
                    Label("New Tab", systemImage: "plus.square")
                }
            } label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(Theme.text)
                    .padding(.trailing, 8)
            }
        }
        .background(Theme.background)
        .onTapGesture {
            isEditing = true
        }
    }
}
