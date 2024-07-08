//
//  PropertyView.swift
//  SwiftUIHomeRentalApp
//
//  Created by Shivam Shishangia on 08/07/24.
//

import SwiftUI

struct PropertyView: View {
    var property: Property
    var body: some View {
        VStack(alignment: .leading) {
            Image(property.image)
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 110)
                .clipped()
            
            Text("$ \(property.price)")
                .font(.headline)
                .foregroundColor(.red)
                .padding(.leading, 5)
                .clipped()
            
            Text("\(property.bedroom) bed - \(property.bathroom) bath")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.leading, 5)
                .clipped()
            
            Text(property.address)
                .font(.subheadline)
                .padding(.leading, 5)
                .clipped()
                .lineLimit(1)
        }
        .padding(.bottom, 5)
        .frame(maxWidth: 140)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray5), lineWidth: 1.5)
        )
    }
}

struct PropertyView_Previews: PreviewProvider {
    static var previews: some View {
        PropertyView(property: Property(price: 50, bedroom: 2, bathroom: 2, address: "Test"))
    }
}
