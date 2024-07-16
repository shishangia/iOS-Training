//
//  PropertyGridView.swift
//  SwiftUIHomeRentalApp
//
//  Created by Shivam Shishangia on 08/07/24.
//

import SwiftUI

struct PropertyGridView: View {
    var properties = Property.generateMock()
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Popular in Residential for Rent")
                    .font(.headline)
                
                Spacer()
                
                Image(systemName: "arrow.right")
                    .padding(.trailing)
            }

            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.flexible())], spacing: 10) {
                    ForEach(properties, id: \.self) { property in
                        PropertyView(property: property)
                    }
                }
            }
            Spacer()
        }
    }
}

struct PropertyGridView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyGridView()
    }
}
