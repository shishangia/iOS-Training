//
//  ContentView.swift
//  SwiftUIToDoAPI
//
//  Created by Shivam Shishangia on 09/07/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ToDoViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            Text("ToDo List")
                .font(.title)
                .padding()
            
            List {
                ForEach(viewModel.toDoList) { todo in
                    ToDoRow(todo: todo)
                }
            }
            .listStyle(.plain)
            .task {
                await viewModel.fetchToDoData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
