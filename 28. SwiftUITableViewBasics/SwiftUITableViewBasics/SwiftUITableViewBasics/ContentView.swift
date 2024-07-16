//
//  ContentView.swift
//  SwiftUITableViewBasics
//
//  Created by Shivam Shishangia on 02/07/24.
//

import SwiftUI

struct ContentView: View {
    @State var isSelectedArray = Array(repeating: false, count: 100)

    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button("Color All", action: {
                    isSelectedArray = Array(repeating: true, count: 100)
                })
                
                Spacer()
                
                Button("Reset All", action: {
                    isSelectedArray = Array(repeating: false, count: 100)
                })
                
                Spacer()
            }.padding()

            List {
                ForEach(isSelectedArray.indices, id: \.self) { index in
                    Text(isSelectedArray[index] ? "Hello selected \(index + 1)" : String(index + 1))
                        .onTapGesture {
                            isSelectedArray[index].toggle()
                        }
                        .padding(.horizontal)
                        .listRowBackground(backgroundColor(for: index + 1, isSelected: isSelectedArray[index]))
                }
            }
            .listStyle(.plain)
        }
        .padding(.vertical)
    }
    
    func backgroundColor(for number: Int, isSelected: Bool) -> Color {
        guard isSelected else {
            return Color.white
        }
        if number % 2 == 0 && number % 5 == 0 {
            return Color.green
        } else if number % 2 == 0 {
            return Color.yellow
        } else if number % 5 == 0 {
            return Color.red
        } else {
            return Color.white
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
