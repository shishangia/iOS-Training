//
//  CategoryView.swift
//  SwiftUIHomeRentalApp
//
//  Created by Shivam Shishangia on 08/07/24.
//

import SwiftUI

struct CategoryView: View {
    var category: Category
    var body: some View {
        VStack {
            Image(systemName: category.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .foregroundColor(.red)
            
            Text(category.name)
                .font(.system(size: 12, weight: .bold))
                .lineLimit(2)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(width: 110, height: 110)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.gray, lineWidth: 1.5)
        )
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category(name: "Rooms for rent"))
    }
}
