//
//  GridContentView.swift
//  SwiftUITableViewBasics
//
//  Created by Shivam Shishangia on 03/07/24.
//

import SwiftUI

struct GridContentView: View {
    @Binding var isSelectedArray: [Bool]

    var body: some View {
        ForEach(isSelectedArray.indices, id: \.self) { index in
            Text("\(index + 1)")
                .frame(width: 60, height: 60)
                .background(backgroundColor(for: index + 1, isSelected: isSelectedArray[index]))
                .cornerRadius(8)
                .onTapGesture {
                    isSelectedArray[index].toggle()
                }
        }
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
            return Color.gray
        }
    }
}

struct GridContentView_Previews: PreviewProvider {
    @State static var isSelectedArray = Array(repeating: false, count: 100)

    static var previews: some View {
        GridContentView(isSelectedArray: $isSelectedArray)
    }
}
