//
//  ContentView.swift
//  ExpandableTableView
//
//  Created by Shivam Shishangia on 01/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var items: [Item] = Item.mock()

    var body: some View {
            List {
                ForEach(items.indices, id: \.self) { index in
                    HStack {
                        Text(items[index].title)
                            .font(.headline)
                        
                        Spacer()
                        
                        Image(systemName: items[index].isExpanded ? "chevron.down" : "chevron.right")
                    }
                    .onTapGesture {
                        items[index].isExpanded.toggle()
                    }

                    if items[index].isExpanded {
                        ForEach(items[index].details, id: \.self) { detail in
                            Text(detail)
                                .padding(.leading, 10)
                        }
                    }
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
