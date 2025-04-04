//
//  BrowserView.swift
//  iOS-Browser
//
//  Created by Krisna Pranav on 04/04/25.
//

import SwiftUI

struct BrowserView: View {
    @StateObject private var browserVM = BrowserViewModel()
    @StateObject private var tabVM = TabViewModel()

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)

            VStack(spacing: 0) {
                AddressBarView(tabVM: tabVM, browserVM: browserVM)

                if let tab = browserVM.selectedTab {
                    WebView(viewModel: tabVM)
                        .id(tab.id)
                }

                ToolbarView(tabVM: tabVM, browserVM: browserVM)
            }
        }
        .sheet(isPresented: $browserVM.showTabView) {
            TabView(browserVM: browserVM)
                .preferredColorScheme(.dark)
        }
        .sheet(isPresented: $browserVM.showSettings) {
            SettingsView(browserVM: browserVM)
                .preferredColorScheme(.dark)
        }
        .onAppear {
            Theme.navigationBarAppearance()
        }
    }
}
