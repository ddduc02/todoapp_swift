//
//  TodoListItemView.swift
//  Todo
//
//  Created by DucDo on 06/08/2023.
//

import SwiftUI

struct TaskView: View {
    let item : Task
    @StateObject var viewModel = TaskViewViewModel()
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .fontWeight(.bold)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
            }
            Spacer()
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
       
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(item: Task(id: "abcx", title: "Do something here", dueDate: Date().timeIntervalSinceNow, createdData: Date().timeIntervalSinceNow, isDone: false))
    }
}
