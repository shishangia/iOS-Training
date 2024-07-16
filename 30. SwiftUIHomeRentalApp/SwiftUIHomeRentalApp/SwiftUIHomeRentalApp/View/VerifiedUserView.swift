//
//  VerifiedUserView.swift
//  SwiftUIHomeRentalApp
//
//  Created by Shivam Shishangia on 08/07/24.
//

import SwiftUI

struct VerifiedUserView: View {
    var body: some View {
        HStack {
            VStack {
                Spacer()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
                    .frame(width: 80)
                    
                Spacer()
            }
            .background(Color(.systemGray6))
            
            VStack(alignment: .leading) {
                Text("Become a verified user")
                    .font(.headline)
                    .padding(.bottom, 5)
                Text("Build Trust\nGet increased visibility\nUnlock Exclusive rewards")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                Button(action: {
                    print("Get started pressed")
                }) {
                    Text("Get started.")
                        .font(.subheadline)
                        .foregroundColor(.blue)
                }
                .padding(.trailing)
            }
            .padding()
            
            Spacer()
            
            Image(systemName: "arrow.right")
                .padding(.trailing)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray5), lineWidth: 1.5)
        )
        .frame(maxWidth: .infinity, maxHeight: 165)
    }
}

struct VerifiedUserView_Previews: PreviewProvider {
    static var previews: some View {
        VerifiedUserView()
    }
}
