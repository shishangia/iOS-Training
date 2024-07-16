//
//  CollectionView.swift
//  SwiftUITableViewBasics
//
//  Created by Shivam Shishangia on 03/07/24.
//

import SwiftUI

struct CollectionView: View {
    @State var isSelectedArray = Array(repeating: false, count: 100)
    @State private var isHorizontal = false

    var body: some View {
        VStack {
            Toggle("Horizontal Scrolling", isOn: $isHorizontal)
            
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
            }.padding(.horizontal)

            ScrollView(isHorizontal ? .horizontal : .vertical) {
                let gridItems = Array(repeating: GridItem(.fixed(60)), count: 5)
                if isHorizontal {
                    LazyHGrid(rows: gridItems, spacing: 10) {
                        GridContentView(isSelectedArray: $isSelectedArray)
                    }
                    .padding()
                } else {
                    LazyVGrid(columns: gridItems, spacing: 10) {
                        GridContentView(isSelectedArray: $isSelectedArray)
                    }
                    .padding()
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
