//
//  TaskModel.swift
//  floating taskbar app
//
//  Created by Lilia Benny on 22/02/2026.
//

import Foundation
import Combine
import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isDone: Bool
}

class TaskStore: ObservableObject {
    @Published var tasks: [Task] = []

    var progress: Double {
        guard !tasks.isEmpty else { return 0 }
        let done = tasks.filter { $0.isDone }.count
        return Double(done) / Double(tasks.count)
    }

    func addTask(_ title: String) {
        tasks.append(Task(title: title, isDone: false))
    }

    func toggle(_ task: Task) {
        if let i = tasks.firstIndex(where: {$0.id == task.id}) {
            tasks[i].isDone.toggle()
        }
    }

    func delete(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
