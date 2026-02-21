//
//  FloatingWindow.swift
//  floating taskbar app
//
//  Created by Lilia Benny on 22/02/2026.
//

import SwiftUI
import AppKit

struct WindowAccessor: NSViewRepresentable {
    func makeNSView(context: Context) -> NSView {
        let view = NSView()

        DispatchQueue.main.async {
            if let window = view.window {
                window.level = .floating
                window.isOpaque = false
                window.backgroundColor = .clear
                window.titleVisibility = .hidden
                window.titlebarAppearsTransparent = true
                window.styleMask.insert(.fullSizeContentView)
                window.isMovableByWindowBackground = true
            }
        }

        return view
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
}
