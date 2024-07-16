//
//  ToDoRow.swift
//  SwiftUIToDoAPI
//
//  Created by Shivam Shishangia on 09/07/24.
//

import SwiftUI

struct ToDoRow: View {
    var todo: ToDo
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(todo.title)
                    .font(.headline)
                Text(todo.completed ? "Completed" : "Not Completed")
                    .foregroundColor(todo.completed ? .green : .red)
            }
            Spacer()
        }
    }
}

struct ToDoRow_Previews: PreviewProvider {
    static var previews: some View {
        ToDoRow(todo: ToDo(id: 1, title: "Test", completed: true))
    }
}
