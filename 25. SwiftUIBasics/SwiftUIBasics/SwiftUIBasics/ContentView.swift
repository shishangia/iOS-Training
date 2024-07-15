//
//  ContentView.swift
//  SwiftUIBasics
//
//  Created by Shivam Shishangia on 27/06/24.
//

import SwiftUI

struct ContentView: View {
    @State var labels = Array(repeating: "Swift-UI", count: 9)

    var body: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()
                
                Button("Add Label") {
                    labels.append("New Label")
                }
                
                Spacer()
                
                Button("Remove Label") {
                    if !labels.isEmpty {
                        labels.removeLast()
                    }
                }
                Spacer()
            }
            .padding(.vertical, 50)
            
            Spacer()

            List {
                ForEach(labels.indices, id: \.self) { index in
                    Text(labels[index])
                        .font(.system(size: 16))
                        .foregroundColor(Color.red)
                }
            }

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
