//
//  InputTextFieldWithImage.swift
//  SwiftUILoginScreen
//
//  Created by Shivam Shishangia on 01/07/24.
//

import SwiftUI

struct InputTextFieldWithImage: View {
    let imageName: String
    let placeholderText: String
    @Binding var text: String
    var isSecure: Bool = false

    var body: some View {
        HStack {
            Image(systemName: imageName)
                .foregroundColor(.blue)
                .font(.system(size: 20))
            
            if isSecure {
                SecureField(placeholderText, text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            } else {
                TextField(placeholderText, text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
        .padding(.vertical, 5)
    }
}

struct CustomTextField_Previews: PreviewProvider {
    @State static var sampleText = ""
    
    static var previews: some View {
        InputTextFieldWithImage(imageName: "gear", placeholderText: "Placeholder Text", text: $sampleText)
    }
}
