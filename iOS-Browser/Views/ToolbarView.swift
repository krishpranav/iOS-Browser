//
//  ToolbarView.swift
//  iOS-Browser
//
//  Created by Krisna Pranav on 04/04/25.
//

import SwiftUI

struct ToolbarView: View {
    @ObservedObject var tabVM: TabViewModel
    @ObservedObject var browserVM: BrowserViewModel

    var body: some View {
        HStack {
            Button(action: {
                tabVM.goBack()
            }) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(tabVM.canGoBack ? Theme.accent : Theme.text.opacity(0.3))
                    .frame(width: 44, height: 44)
            }
            .disabled(!tabVM.canGoBack)

            Button(action: {
                tabVM.goForward()
            }) {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(tabVM.canGoForward ? Theme.accent : Theme.text.opacity(0.3))
                    .frame(width: 44, height: 44)
            }
            .disabled(!tabVM.canGoForward)

            Spacer()

            Button(action: {
                tabVM.reload()
            }) {
                Image(systemName: "arrow.clockwise")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Theme.accent)
                    .frame(width: 44, height: 44)
            }

            Spacer()

            Button(action: {
                browserVM.showTabView.toggle()
            }) {
                Image(systemName: "square.on.square")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Theme.accent)
                    .frame(width: 44, height: 44)
            }

            Button(action: {
                browserVM.showSettings.toggle()
            }) {
                Image(systemName: "gear")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Theme.accent)
                    .frame(width: 44, height: 44)
            }
        }
        .padding(.horizontal, 8)
        .background(Theme.background)
        .frame(height: 44)
    }
}
