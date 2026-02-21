//
//  ContentView.swift
//  floating taskbar app
//
//  Created by Lilia Benny on 22/02/2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var store = TaskStore()
    @State private var newTask = ""

    var body: some View {
        VStack(spacing: 12) {

            // progress bar
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 14)

                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.blue)
                    .frame(width: CGFloat(store.progress) * 260, height: 14)
                    .animation(.easeInOut, value: store.progress)
            }
            .frame(width: 260)

            // task list
            List {
                ForEach(store.tasks) { task in
                    HStack {
                        Button {
                            store.toggle(task)
                        } label: {
                            Image(systemName:
                                task.isDone ? "checkmark.circle.fill" : "circle"
                            )
                        }
                        .buttonStyle(.plain)

                        Text(task.title)
                            .strikethrough(task.isDone)
                    }
                }
                .onDelete(perform: store.delete)
            }
            .frame(height: 180)

            // add task field
            HStack {
                TextField("New task...", text: $newTask)
                Button("Add") {
                    guard !newTask.isEmpty else { return }
                    store.addTask(newTask)
                    newTask = ""
                }
            }
        }
        .padding()
        .frame(width: 300)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}
