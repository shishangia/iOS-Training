//
//  SearchBarView.swift
//  SwiftUIHomeRentalApp
//
//  Created by Shivam Shishangia on 08/07/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String

    var body: some View {
        HStack {
            Image(systemName: "house.lodge")
                .foregroundColor(.red)
  
            ZStack(alignment: .leading) {
                if text.isEmpty {
                    HStack {
                        Text("Search ")
                            .foregroundColor(.black)
                        Text("for property for rent")
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 8)
                }
            TextField("", text: $text)
                    .padding(.leading, 8)
            }
            
            Image(systemName: "bell")
                .foregroundColor(.gray)
                .padding(.leading, 8)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(.gray, lineWidth: 1.5)
        )
    }
}

struct SearchBarView_Previews: PreviewProvider {
    @State static var sampleText = ""

    static var previews: some View {
        SearchBarView(text: $sampleText)
    }
}
