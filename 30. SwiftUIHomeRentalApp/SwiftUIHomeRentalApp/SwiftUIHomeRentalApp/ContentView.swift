//
//  ContentView.swift
//  SwiftUIHomeRentalApp
//
//  Created by Shivam Shishangia on 08/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText: String = ""
    @State private var categories = Category.generateMock()

    var body: some View {
        ScrollView {
            VStack {
                SearchBarView(text: $searchText)
                    .padding(.bottom, 20)
                
                CategoryGridView()
                    .padding(.bottom, 20)
                
                VerifiedUserView()
                    .padding(.bottom, 20)
                
                PropertyGridView()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
