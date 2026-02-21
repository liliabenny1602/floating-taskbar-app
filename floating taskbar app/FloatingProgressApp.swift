//
//  floating_taskbar_appApp.swift
//  floating taskbar app
//
//  Created by Lilia Benny on 22/02/2026.
//

import SwiftUI

@main
struct FloatingProgressApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .background(WindowAccessor())
        }
        .windowStyle(.hiddenTitleBar)
    }
}
