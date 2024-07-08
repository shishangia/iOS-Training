//
//  LoginButtonView.swift
//  SwiftUIHomeRentalApp
//
//  Created by Shivam Shishangia on 08/07/24.
//

import SwiftUI

struct LoginButtonView: View {
    var text: String
    var image: String?
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                if let image = image {
                    Image(image)
                        .resizable()
                        .frame(width: 20, height: 20)
                } else {
                    Image(systemName: "envelope.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                        .foregroundColor(.red)
                }
                
                Text("Continue with \(text)")
                    .foregroundColor(.black)
                    .font(.title2)
                    .padding(.leading)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 1.5)
            )
        }
    }
}

struct LoginButtonView_Previews: PreviewProvider {
    static var previews: some View {
        LoginButtonView(text: "Test", image: "Facebook") {
            print("Button tapped")
        }
    }
}
